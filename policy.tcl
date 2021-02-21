# -*- tcl -*-
## Ankh - Andreas Kupries Hashes
## (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

# Generate the public ensemble structure from the low-level hash commands.

# # ## ### ##### ######## #############

foreach hash {
    aich
    blake2b blake2s
    btih
    ed2k
    edonr/224 edonr/256 edonr/384 edonr/512
    gost12/256 gost12/512
    gost94
    has160
    md4
    md5
    ripemd160
    sha1
    sha2/224 sha2/256 sha2/384 sha2/512
    sha3/224 sha3/256 sha3/384 sha3/512
    snefru/128 snefru/256
    tiger
    tth
    whirlpool
} {
    namespace eval ::ak::hash [list namespace export $hash]
    # All the aggregated commands are defined as cprocs and cconsts.
    namespace eval ::ak::hash::${hash} {
	namespace export   path channel string size references
	namespace ensemble create
    }
}

namespace eval ::ak::hash {
    namespace export list version
    namespace ensemble create
}
namespace eval ::ak {
    namespace export hash
    namespace ensemble create
}

# # ## ### ##### ######## #############
return
