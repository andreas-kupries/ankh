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

    # Hash the data in a file.
    critcl::cproc ::ak::hash::${hash}::path {
	Tcl_Interp* interp
	char*       path
    } object0 [string map $map {
	unsigned char hash [@hsize@];
	@context@ context;

	Tcl_Channel chan = Tcl_OpenFileChannel (interp, path, "rb", 0);
	if (chan == NULL) {
	    return NULL;
	}

	Tcl_SetChannelBufferSize(chan, BUF_SIZE);

	unsigned char* receiver = Tcl_Alloc (CHUNK_SIZE);

	@init@ (&context);
	while (!Tcl_Eof (chan)) {
	    int received = Tcl_Read (chan, receiver, CHUNK_SIZE);
	    if (!received) continue;
	    @update@ (&context, receiver, received);
	}

	Tcl_Free (receiver);
	Tcl_Close (interp, chan);

	@final@ (@fargs@);
	return Tcl_NewByteArrayObj (hash, @hsize@);
    }]

    # Hash the data in a channel, from current position to end of channel
    critcl::cproc ::ak::hash::${hash}::channel {
	channel chan
    } object0 [string map $map {
	unsigned char hash [@hsize@];
	@context@ context;
	unsigned char* receiver = Tcl_Alloc (CHUNK_SIZE);

	Tcl_SetChannelBufferSize(chan, BUF_SIZE);

	@init@ (&context);
	while (!Tcl_Eof (chan)) {
	    int received = Tcl_Read (chan, receiver, CHUNK_SIZE);
	    if (!received) continue;
	    @update@ (&context, receiver, received);
	}
	Tcl_Free (receiver);
	@final@ (@fargs@);
	return Tcl_NewByteArrayObj (hash, @hsize@);
    }]

    # Hash the data in a Tcl ByteArray
    critcl::cproc ::ak::hash::${hash}::string {
	bytes str
    } object0 [string map $map {
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
