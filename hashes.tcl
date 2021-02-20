# -*- tcl -*-
## Ankh - Andreas Kupries Hashes
## (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

# Hash definitions. Consumed by the command implementations.

# # ## ### ##### ######## #############

proc hashes {} {
    return {
	sha1 {
	    refs {
		https://en.wikipedia.org/wiki/SHA-1
	    }
	    hsize   20
	    header  sha1.h
	    context SHA1_CTX
	    init    SHA1Init
	    update  SHA1Update
	    final   SHA1Final
	    forder  HC
	}
	sha2 {
	    refs {
		https://en.wikipedia.org/wiki/SHA-2
	    }
	    hsize   SHA256_HASH_SIZE
	    header  sha256.h
	    context SHA256Context
	    init    SHA256Init
	    update  SHA256Update
	    final   SHA256Final
	    forder  CH
	}
	sha3 {
	    refs {
		https://en.wikipedia.org/wiki/SHA-3
		http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
		https://github.com/brainhub/SHA3IUF
		MIT
	    }
	    hsize   32
	    header  sha3.h
	    context sha3_context
	    init    sha3_Init256
	    update  sha3_Update
	    final   sha3_Final
	    forder  HC
	}
	md4 {
	    refs {
		https://en.wikipedia.org/wiki/MD4
	    }
	    hsize   16
	    header  md4.h
	    context MD4_CTX
	    init    MD4Init
	    update  MD4Update
	    final   MD4Final
	    forder  HC
	}
	md5 {
	    refs {
		https://en.wikipedia.org/wiki/MD5
	    }
	    hsize   16
	    header  md5.h
	    context MD5_CTX
	    init    MD5Init
	    update  MD5Update
	    final   MD5Final
	    forder  HC
	}
    }
}

# # ## ### ##### ######## #############
return
