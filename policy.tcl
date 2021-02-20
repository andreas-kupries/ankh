# -*- tcl -*-
## Ankh - Andreas Kupries Hashes
## (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

# Generate the public ensemble structure from the low-level hash commands.

# # ## ### ##### ######## #############

foreach hash {
    md4 md5 sha1 sha2 sha3
} {
    namespace eval ::ak::hash [list namespace export $hash]
    namespace eval ::ak::hash::${hash} {
	namespace export   path channel string size references
	namespace ensemble create
    }
    # All the aggregated commands are defined as cprocs and cconsts.
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
