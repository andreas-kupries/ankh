# -*- tcl -*-
## Ankh - Andreas Kupries Hashes
## (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

# Hash definitions. Consumed by the command implementations.

# # ## ### ##### ######## #############

if {$tcl_platform(byteOrder) eq "littleEndian"} {
    set byteOrder 1234
} else {
    set byteOrder 4321
}

# TODO: x-compilation capability

critcl::cflags -DTCL_BYTE_ORDER=$byteOrder

critcl::cheaders c/rhash/librhash/byte_order.h
critcl::csources c/rhash/librhash/byte_order.c

proc rhash/def {hash {spec {}}} {
    lappend map @@ $hash
    foreach {key default} {
	hsize   @@_hash_size
	header	c/rhash/librhash/@@.h
	csource	c/rhash/librhash/@@.c
	context	@@_ctx
	init	rhash_@@_init
	update	rhash_@@_update
	final   rhash_@@_final
	forder  CH
    } {
	if {[dict exists $spec $key]} continue
	dict set spec $key [string map $map $default]
    }

    dict lappend spec refs https://github.com/rhash/RHash
    dict lappend spec refs https://github.com/rhash/RHash/blob/master/COPYING
    dict lappend spec refs http://rhash.sourceforge.net/hashes.php
    dict lappend spec refs {BSD zero-clause}

    return $spec
}

proc hashes {} {
    set hashes {}

    dict set hashes sha1 {
	refs {
	    https://en.wikipedia.org/wiki/SHA-1
	    http://www.faqs.org/rfcs/rfc3174.html
	}
	hsize   20
	header  c/sha1/sha1_.h
	csource c/sha1/sha1.c
	context SHA1_CTX
	init    SHA1Init
	update  SHA1Update
	final   SHA1Final
	forder  HC
    }

    dict set hashes md4  [rhash/def md4 { refs { https://en.wikipedia.org/wiki/MD4 }}]
    dict set hashes md5  [rhash/def md5 { refs { https://en.wikipedia.org/wiki/MD5 }}]
    dict set hashes sha2 [rhash/def sha256 {
	refs {
	    https://en.wikipedia.org/wiki/SHA-2
	    http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
	}}]
    dict set hashes sha3 [rhash/def sha3 {
	hsize sha3_256_hash_size
	init  rhash_sha3_256_init
	refs {
	    https://en.wikipedia.org/wiki/SHA-3
	    http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
	    http://keccak.noekeon.org/
	}}]

    # https://sourceforge.net/p/rhash/wiki/HashFunctions/

    # Memoize
    rename hashes {}
    proc   hashes {} [list return $hashes]
    rename rhash/def {}
    return $hashes
}

# # ## ### ##### ######## #############
return
