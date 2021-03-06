# -*- tcl -*-
## Ankh - Andreas Kupries Hashes
## (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

# Hash command implementations.

# # ## ### ##### ######## #############

critcl::ccode {
    #define CHUNK_SIZE (16*1024*1024) /* 16 MiB */
    #define BUF_SIZE   (100*1000)     /* 0.5 MiB (max: 1 MB) */
}

# Introspect the set of builtin hashes
critcl::cconst ::ak::hash::list char* "\"[lsort -dict [dict keys [hashes]]]\""

# (***) Get all the headers and sources first.
dict for {hash spec} [hashes] {
    set h [dict get $spec header]
    if {$h eq {}} continue
    critcl::cheaders $h
    critcl::include  [file tail $h]
}

dict for {hash spec} [hashes] {
    set c [dict get $spec csource]
    if {$c eq {}} continue
    critcl::csources $c
}

dict for {hash spec} [hashes] {
    dict with spec {}
    # - refs	References to articles, implementations, ...
    # - hsize	Size of hash digest, numeric, or symbolic
    # - csource Name of C source file to compile (IGNORED HERE, see (***))
    # - header  Name of header file to include (IGNORED HERE, see (***))
    # - context Name of C type for the internal hash state
    # - init    Name of C function to initialize the hash state
    # - update  Name of C function to update the hash state with a message chunk
    # - final   Name of C function to fialize the hash state ito a digest
    # - forder  Code for argument order of final.

    lappend map @@        [string map {/ _} $hash]
    lappend map @init@    $init
    lappend map @update@  $update
    lappend map @final@   $final
    lappend map @context@ $context
    lappend map @hsize@   $hsize
    lappend map @fargs@   [dict get {
	HC {hash, &context}
	CH {&context, hash}
    } $forder]

    # Introspection: digest size, and references
    critcl::cconst ::ak::hash::${hash}::size       int   $hsize
    critcl::cconst ::ak::hash::${hash}::references char* "\"[lrange $refs 0 end]\""

    # Common channel code for the hash.
    critcl::ccode [string map $map {
	static Tcl_Obj* do_chan_@@ (Tcl_Interp* ip, Tcl_Channel chan, _options* opts) {
	    unsigned char hash [@hsize@];
	    @context@ context;

	    if (opts->offset > 0) {
		/* Skip forward in the channel. By comparing the positions before and after
		 * we determine of we skipped over the end of the channel, or not
		 */
		Tcl_WideInt before = Tcl_Tell (chan);
		Tcl_Seek (chan, opts->offset, SEEK_CUR);
		Tcl_WideInt after  = Tcl_Tell (chan);

		if (after < (before + opts->offset)) {
		    /* Beyond eof, treat as empty input */
		    @init@ (&context);
		    goto done;
		}
	    }

	    @init@ (&context);
	    if (opts->length == 0) goto done;

	    unsigned char* receiver = Tcl_Alloc (CHUNK_SIZE);
	    Tcl_SetChannelBufferSize(chan, BUF_SIZE);

	    if (opts->length > 0) {
		/* Loop limited by end of channel and user-specified maximum */
		while (!Tcl_Eof (chan) && (opts->length > 0)) {
		    int toget    = (opts->length < CHUNK_SIZE ? opts->length : CHUNK_SIZE);
		    int received = Tcl_Read (chan, receiver, toget);
		    if (!received) continue;
		    @update@ (&context, receiver, received);
		    opts->length -= received;
		}
	    } else {
		/* Loop limited only by end of channel */
		while (!Tcl_Eof (chan)) {
		    int received = Tcl_Read (chan, receiver, CHUNK_SIZE);
		    if (!received) continue;
		    @update@ (&context, receiver, received);
		}
	    }

	    Tcl_Free (receiver);
	    done:
	    @final@ (@fargs@);
	    return Tcl_NewByteArrayObj (hash, @hsize@);
	}
    }]

    # Hash the data in a file.
    critcl::cproc ::ak::hash::${hash}::path {
	Tcl_Interp* ip
	char*       path
	object      args
    } object0 [string map $map {
	_options opts;
	if (TCL_OK != handle_options (&opts, ip, (Tcl_Obj**) args.v, args.c)) { return 0; }

	Tcl_Channel chan = Tcl_OpenFileChannel (ip, path, "rb", 0);
	if (chan == NULL) {
	    return NULL;
	}

	Tcl_Obj* r = do_chan_@@ (ip, chan, &opts);
	Tcl_Close (ip, chan);

	return r;
    }]

    # Hash the data in a channel, from current position to end of channel
    critcl::cproc ::ak::hash::${hash}::channel {
	Tcl_Interp* ip
	channel     chan
	object      args
    } object0 [string map $map {
	_options opts;
	if (TCL_OK != handle_options (&opts, ip, (Tcl_Obj**) args.v, args.c)) { return 0; }

	return do_chan_@@ (ip, chan, &opts);
    }]

    # Hash the data in a Tcl ByteArray
    critcl::cproc ::ak::hash::${hash}::string {
	Tcl_Interp* ip
	bytes       str
	object      args
    } object0 [string map $map {
	_options opts;
	if (TCL_OK != handle_options (&opts, ip, (Tcl_Obj**) args.v, args.c)) { return 0; }

	if (opts.offset > 0) {
	    if (opts.offset > str.len) {
		/* Hashing behind the end of the string ~~ Hashing of empty string */
		str.len = 0;
	    } else {
		/* Skip forward over the unwanted prefix */
		str.s   += opts.offset;
		str.len -= opts.offset;
	    }
	}
	if (opts.length >= 0) {
	    if (opts.length < str.len) {
		/* Truncate the unwanted suffix */
		str.len = opts.length;
	    }
	}

	unsigned char hash [@hsize@];
	@context@ context;

	@init@   (&context);
	@update@ (&context, str.s, str.len);
	@final@  (@fargs@);
	return Tcl_NewByteArrayObj (hash, @hsize@);
    }]

    set map {}
}

# # ## ### ##### ######## #############
return
