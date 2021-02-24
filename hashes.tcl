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
critcl::csources c/rhash/librhash/hex.c
critcl::csources c/rhash/librhash/tiger_sbox.c
critcl::csources c/rhash/librhash/whirlpool_sbox.c
critcl::csources c/rhash/librhash/sha1.c ;# Building block for some other hashes

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

    dict set hashes aich      [rhash/def aich   { hsize 20
	refs {
	    https://en.wikipedia.org/wiki/EMule#Basic_concepts
	}}]
    dict set hashes blake2b   [rhash/def blake2b]
    dict set hashes blake2s   [rhash/def blake2s]
    dict set hashes ed2k      [rhash/def ed2k   { hsize 16
	refs {
	    https://en.wikipedia.org/wiki/EDonkey2000
	    https://en.wikipedia.org/wiki/EDonkey_network#Hash_identification
	    https://en.wikipedia.org/wiki/Ed2k_URI_scheme#eD2k_hash_algorithm
    }}]
    dict set hashes gost94    [rhash/def gost94 { hsize gost94_hash_length
	refs {
	    https://en.wikipedia.org/wiki/GOST_(hash_function)
	    https://tools.ietf.org/html/rfc5831
	    https://tools.ietf.org/html/rfc4357
    }}]
    dict set hashes has160    [rhash/def has160 { refs {
	https://en.wikipedia.org/wiki/HAS-160
	http://www.randombit.net/has160.html
	https://en.wikipedia.org/wiki/KCDSA
    }}]
    dict set hashes md4       [rhash/def md4    { refs { https://en.wikipedia.org/wiki/MD4 }}]
    dict set hashes md5       [rhash/def md5    { refs { https://en.wikipedia.org/wiki/MD5 }}]
    dict set hashes tiger     [rhash/def tiger  { hsize tiger_hash_length
	refs {
	    https://en.wikipedia.org/wiki/Tiger_(hash_function)
	}}]
    dict set hashes tth       [rhash/def tth    {
	hsize tiger_hash_length
	refs {
	    https://en.wikipedia.org/wiki/Merkle_tree#Tiger_tree_hash
	}}]
    dict set hashes whirlpool [rhash/def whirlpool { hsize whirlpool_block_size
	refs {
	    https://en.wikipedia.org/wiki/Whirlpool_(hash_function)
	}}]

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

    dict set hashes sha2/256 [rhash/def sha256 {
	refs {
	    https://en.wikipedia.org/wiki/SHA-2
	    http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
	}}]

    dict set hashes sha2/224 [rhash/def sha256 {
	hsize sha224_hash_size
	init  rhash_sha224_init
	header   {}
	csources {}
	refs {
	    https://en.wikipedia.org/wiki/SHA-2
	    http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
	}}]

    dict set hashes sha2/512 [rhash/def sha512 {
	refs {
	    https://en.wikipedia.org/wiki/SHA-2
	    http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
	}}]

    dict set hashes sha2/384 [rhash/def sha512 {
	hsize sha384_hash_size
	init  rhash_sha384_init
	header   {}
	csources {}
	refs {
	    https://en.wikipedia.org/wiki/SHA-2
	    http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
	}}]

    dict set hashes sha3/256 [rhash/def sha3 {
	hsize sha3_256_hash_size
	init  rhash_sha3_256_init
	refs {
	    https://en.wikipedia.org/wiki/SHA-3
	    http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
	    http://keccak.noekeon.org/
	}}]

    dict set hashes sha3/224 [rhash/def sha3 {
	hsize sha3_224_hash_size
	init  rhash_sha3_224_init
	header   {}
	csources {}
	refs {
	    https://en.wikipedia.org/wiki/SHA-3
	    http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
	    http://keccak.noekeon.org/
	}}]

    dict set hashes sha3/384 [rhash/def sha3 {
	hsize sha3_384_hash_size
	init  rhash_sha3_384_init
	header   {}
	csources {}
	refs {
	    https://en.wikipedia.org/wiki/SHA-3
	    http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
	    http://keccak.noekeon.org/
	}}]

    dict set hashes sha3/512 [rhash/def sha3 {
	hsize sha3_512_hash_size
	init  rhash_sha3_512_init
	header   {}
	csources {}
	refs {
	    https://en.wikipedia.org/wiki/SHA-3
	    http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
	    http://keccak.noekeon.org/
	}}]

    dict set hashes edonr/224 [rhash/def edonr {
	hsize  edonr224_hash_size
	init   rhash_edonr224_init
	update rhash_edonr256_update
	final  rhash_edonr256_final
    }]

    dict set hashes edonr/256 [rhash/def edonr {
	header   {}
	csources {}
	hsize  edonr256_hash_size
	init   rhash_edonr256_init
	update rhash_edonr256_update
	final  rhash_edonr256_final
    }]

    dict set hashes edonr/384 [rhash/def edonr {
	header   {}
	csources {}
	hsize  edonr384_hash_size
	init   rhash_edonr384_init
	update rhash_edonr512_update
	final  rhash_edonr512_final
    }]

    dict set hashes edonr/512 [rhash/def edonr {
	header   {}
	csources {}
	hsize  edonr512_hash_size
	init   rhash_edonr512_init
	update rhash_edonr512_update
	final  rhash_edonr512_final
    }]

    dict set hashes gost12/256 [rhash/def gost12 {
	hsize  gost12_256_hash_size
	init   rhash_gost12_256_init
	refs {
	    https://en.wikipedia.org/wiki/GOST_(hash_function)
	    https://tools.ietf.org/html/rfc5831
	    https://tools.ietf.org/html/rfc4357
	}
    }]

    dict set hashes gost12/512 [rhash/def gost12 {
	header   {}
	csources {}
	hsize  gost12_512_hash_size
	init   rhash_gost12_512_init
	refs {
	    https://en.wikipedia.org/wiki/GOST_(hash_function)
	    https://tools.ietf.org/html/rfc5831
	    https://tools.ietf.org/html/rfc4357
	}
    }]

    dict set hashes ripemd160 [rhash/def ripemd-160 {
	hsize   ripemd160_hash_size
	context	ripemd160_ctx
	init	rhash_ripemd160_init
	update	rhash_ripemd160_update
	final   rhash_ripemd160_final
	refs    https://en.wikipedia.org/wiki/RIPEMD
    }]

    dict set hashes snefru/128 [rhash/def snefru {
	hsize  snefru128_hash_length
	init   rhash_snefru128_init
	refs {
	    https://en.wikipedia.org/wiki/Snefru
	    http://ftp.vim.org/security/coast/crypto/snefru/snefru.c
	}
    }]

    dict set hashes snefru/256 [rhash/def snefru {
	header   {}
	csources {}
	hsize  snefru256_hash_length
	init   rhash_snefru256_init
	refs {
	    https://en.wikipedia.org/wiki/Snefru
	    http://ftp.vim.org/security/coast/crypto/snefru/snefru.c
	}
    }]

    dict set hashes btih [rhash/def torrent {
	hsize   btih_hash_size
	context	torrent_ctx
	init	bt_init
	update	bt_update
	final   bt_final
	refs {
	    https://en.wikipedia.org/wiki/Magnet_URI_scheme#BitTorrent_info_hash_(BTIH)
	}
    }]

    # https://sourceforge.net/p/rhash/wiki/HashFunctions/

    # Memoize
    rename hashes {}
    proc   hashes {} [list return $hashes]
    rename rhash/def {}
    return $hashes
}

# # ## ### ##### ######## #############
return
