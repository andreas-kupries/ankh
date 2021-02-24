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

proc def {hash key value} {
    upvar 1 hashes hashes
    dict set hashes $hash $key $value
    return
}

proc def+ {hash key value} {
    upvar 1 hashes hashes
    try {
	set items [dict get $hashes $hash $key]
    } on error {e o} {
	set items {}
    }
    lappend items $value
    dict set hashes $hash $key $items
    return
}

proc def? {hash key value} {
    upvar 1 hashes hashes
    if {[dict exists $hashes $hash $key]} return
    dict set hashes $hash $key $value
    return
}

proc def/rhash {hash {code {}}} {
    if {$code eq {}} { set code $hash }
    upvar 1 hashes hashes
    def? $hash hsize    ${code}_hash_size
    def? $hash header	c/rhash/librhash/${code}.h
    def? $hash csource	c/rhash/librhash/${code}.c
    def? $hash context	${code}_ctx
    def? $hash init	rhash_${code}_init
    def? $hash update	rhash_${code}_update
    def? $hash final    rhash_${code}_final
    def? $hash forder   CH
    def+ $hash refs     https://github.com/rhash/RHash
    def+ $hash refs     https://github.com/rhash/RHash/blob/master/COPYING
    def+ $hash refs     http://rhash.sourceforge.net/hashes.php
    def+ $hash refs     {BSD zero-clause}
    return
}

proc hashes {} {
    set hashes {}

    def       aich       hsize    20
    def+      aich       refs     https://en.wikipedia.org/wiki/EMule#Basic_concepts
    def/rhash aich

    def/rhash blake2b
    def/rhash blake2s

    def       btih       hsize    btih_hash_size
    def       btih	 context  torrent_ctx
    def       btih	 init	  bt_init
    def       btih	 update	  bt_update
    def       btih	 final    bt_final
    def+      btih       refs     "https://en.wikipedia.org/wiki/Magnet_URI_scheme#BitTorrent_info_hash_(BTIH)"
    def/rhash btih torrent

    def       ed2k       hsize    16
    def+      ed2k       refs     https://en.wikipedia.org/wiki/EDonkey2000
    def+      ed2k       refs     "https://en.wikipedia.org/wiki/EDonkey_network#Hash_identification"
    def+      ed2k       refs     "https://en.wikipedia.org/wiki/Ed2k_URI_scheme#eD2k_hash_algorithm"
    def/rhash ed2k

    def       edonr/224  hsize    edonr224_hash_size
    def       edonr/224  init     rhash_edonr224_init
    def       edonr/224  update   rhash_edonr256_update
    def       edonr/224  final    rhash_edonr256_final
    def/rhash edonr/224  edonr

    def       edonr/256  header   {}
    def       edonr/256  csources {}
    def       edonr/256  hsize    edonr256_hash_size
    def       edonr/256  init     rhash_edonr256_init
    def       edonr/256  update   rhash_edonr256_update
    def       edonr/256  final    rhash_edonr256_final
    def/rhash edonr/256  edonr

    def       edonr/384  header   {}
    def       edonr/384  csources {}
    def       edonr/384  hsize    edonr384_hash_size
    def       edonr/384  init     rhash_edonr384_init
    def       edonr/384  update   rhash_edonr512_update
    def       edonr/384  final    rhash_edonr512_final
    def/rhash edonr/384  edonr

    def       edonr/512  header   {}
    def       edonr/512  csources {}
    def       edonr/512  hsize    edonr512_hash_size
    def       edonr/512  init     rhash_edonr512_init
    def       edonr/512  update   rhash_edonr512_update
    def       edonr/512  final    rhash_edonr512_final
    def/rhash edonr/512  edonr

    def       gost12/256 hsize    gost12_256_hash_size
    def       gost12/256 init     rhash_gost12_256_init
    def+      gost12/256 refs     https://en.wikipedia.org/wiki/GOST_(hash_function)
    def+      gost12/256 refs  	  https://tools.ietf.org/html/rfc5831
    def+      gost12/256 refs  	  https://tools.ietf.org/html/rfc4357
    def/rhash gost12/256 gost12

    def       gost12/512 header   {}
    def       gost12/512 csources {}
    def       gost12/512 hsize    gost12_512_hash_size
    def       gost12/512 init     rhash_gost12_512_init
    def+      gost12/512 refs     https://en.wikipedia.org/wiki/GOST_(hash_function)
    def+      gost12/512 refs  	  https://tools.ietf.org/html/rfc5831
    def+      gost12/512 refs  	  https://tools.ietf.org/html/rfc4357
    def/rhash gost12/512 gost12

    def       gost94     hsize    gost94_hash_length
    def+      gost94     refs     https://en.wikipedia.org/wiki/GOST_(hash_function)
    def+      gost94     refs     https://tools.ietf.org/html/rfc5831
    def+      gost94     refs     https://tools.ietf.org/html/rfc4357
    def/rhash gost94

    def+      has160     refs     https://en.wikipedia.org/wiki/HAS-160
    def+      has160     refs     http://www.randombit.net/has160.html
    def+      has160     refs     https://en.wikipedia.org/wiki/KCDSA
    def/rhash has160

    def+      md4        refs     https://en.wikipedia.org/wiki/MD4
    def/rhash md4

    def+      md5        refs     https://en.wikipedia.org/wiki/MD5
    def/rhash md5

    def       ripemd160  hsize    ripemd160_hash_size
    def       ripemd160  context  ripemd160_ctx
    def       ripemd160  init	  rhash_ripemd160_init
    def       ripemd160  update	  rhash_ripemd160_update
    def       ripemd160  final    rhash_ripemd160_final
    def+      ripemd160  refs     https://en.wikipedia.org/wiki/RIPEMD
    def/rhash ripemd160  ripemd-160

    def       snefru/128 hsize    snefru128_hash_length
    def       snefru/128 init     rhash_snefru128_init
    def+      snefru/128 refs     https://en.wikipedia.org/wiki/Snefru
    def+      snefru/128 refs	  http://ftp.vim.org/security/coast/crypto/snefru/snefru.c
    def/rhash snefru/128 snefru

    def       snefru/256 header   {}
    def       snefru/256 csources {}
    def       snefru/256 hsize    snefru256_hash_length
    def       snefru/256 init     rhash_snefru256_init
    def+      snefru/256 refs     https://en.wikipedia.org/wiki/Snefru
    def+      snefru/256 refs	  http://ftp.vim.org/security/coast/crypto/snefru/snefru.c
    def/rhash snefru/256 snefru

    def       sha1       hsize    20
    def       sha1       header   c/sha1/sha1_.h
    def       sha1       csource  c/sha1/sha1.c
    def       sha1       context  SHA1_CTX
    def       sha1       init     SHA1Init
    def       sha1       update   SHA1Update
    def       sha1       final    SHA1Final
    def       sha1       forder   HC
    def+      sha1       refs     https://en.wikipedia.org/wiki/SHA-1
    def+      sha1       refs     http://www.faqs.org/rfcs/rfc3174.html

    def       sha2/224   hsize    sha224_hash_size
    def       sha2/224   init     rhash_sha224_init
    def+      sha2/224   refs     https://en.wikipedia.org/wiki/SHA-2
    def+      sha2/224   refs     http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
    def/rhash sha2/224   sha256

    def       sha2/256   header   {}
    def       sha2/256   csources {}
    def+      sha2/256   refs     https://en.wikipedia.org/wiki/SHA-2
    def+      sha2/256   refs     http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
    def/rhash sha2/256   sha256

    def       sha2/384   hsize    sha384_hash_size
    def       sha2/384   init     rhash_sha384_init
    def+      sha2/384   refs     https://en.wikipedia.org/wiki/SHA-2
    def+      sha2/384   refs     http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
    def/rhash sha2/384   sha512

    def       sha2/512   header   {}
    def       sha2/512   csources {}
    def+      sha2/512   refs     https://en.wikipedia.org/wiki/SHA-2
    def+      sha2/512   refs     http://csrc.nist.gov/publications/fips/fips180-4/fips-180-4.pdf
    def/rhash sha2/512   sha512


    def       sha3/224   hsize    sha3_224_hash_size
    def       sha3/224   init  	  rhash_sha3_224_init
    def+      sha3/224   refs  	  https://en.wikipedia.org/wiki/SHA-3
    def+      sha3/224   refs  	  http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
    def+      sha3/224   refs     http://keccak.noekeon.org/
    def/rhash sha3/224   sha3

    def       sha3/256   header   {}
    def       sha3/256   csources {}
    def       sha3/256   hsize    sha3_256_hash_size
    def       sha3/256   init  	  rhash_sha3_256_init
    def+      sha3/256   refs  	  https://en.wikipedia.org/wiki/SHA-3
    def+      sha3/256   refs  	  http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
    def+      sha3/256   refs     http://keccak.noekeon.org/
    def/rhash sha3/256   sha3

    def       sha3/384   header   {}
    def       sha3/384   csources {}
    def       sha3/384   hsize    sha3_384_hash_size
    def       sha3/384   init     rhash_sha3_384_init
    def+      sha3/384   refs  	  https://en.wikipedia.org/wiki/SHA-3
    def+      sha3/384   refs  	  http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
    def+      sha3/384   refs     http://keccak.noekeon.org/
    def/rhash sha3/384   sha3

    def       sha3/512   header   {}
    def       sha3/512   csources {}
    def       sha3/512   hsize    sha3_512_hash_size
    def       sha3/512   init     rhash_sha3_512_init
    def+      sha3/512   refs  	  https://en.wikipedia.org/wiki/SHA-3
    def+      sha3/512   refs  	  http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
    def+      sha3/512   refs     http://keccak.noekeon.org/
    def/rhash sha3/512   sha3

    def       tiger      hsize    tiger_hash_length
    def+      tiger      refs     https://en.wikipedia.org/wiki/Tiger_(hash_function)
    def/rhash tiger

    def       tth        hsize    tiger_hash_length
    def+      tth        refs     "https://en.wikipedia.org/wiki/Merkle_tree#Tiger_tree_hash"
    def/rhash tth

    def       whirlpool  hsize    whirlpool_block_size
    def+      whirlpool  refs     https://en.wikipedia.org/wiki/Whirlpool_(hash_function)
    def/rhash whirlpool

    # https://sourceforge.net/p/rhash/wiki/HashFunctions/

    rename def       {}
    rename def+      {}
    rename def?      {}
    rename def/rhash {}

    # Memoize
    rename hashes {}
    proc   hashes {} [list return $hashes]
    return $hashes
}

# # ## ### ##### ######## #############
return
