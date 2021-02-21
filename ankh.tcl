# -*- tcl -*-
# Ankh - ANdreas Kupries Hashes
#
# (c) 2021 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries
#

# # ## ### ##### ######## #############
## Requisites

package require critcl 3.1 ;# 3.1   : critcl::source
#                          ;# 3.0.8 : critcl::at::*
#package require critcl::literals
#package require critcl::emap

# # ## ### ##### ######## #############
## Bail early if the environment is not suitable.

if {![critcl::compiling]} {
    error "Unable to build aktive, no proper compiler found."
}

# # ## ### ##### ######## #############
## Introspection, Version

package provide  ankh 0.0
critcl::cconst ::ak::hash::version char* {"0.0"}

# # ## ### ##### ######## #############
## Administrivia

critcl::license \
    {Andreas Kupries} \
    {Under a BSD license.}

critcl::summary \
    {Commands for using a variety of cryptographically secure hash functions}

critcl::description {
    This package provides a number of commands giving access to a
    variety of cryptographically secure hash functions, old and new.
}

critcl::subject hash {cryptographically secure hash} {secure hash}
critcl::subject md4 md5 sha1 sha2 sha3 haval ripemd

# # ## ### ##### ######## #############
## Implementation.

critcl::tcl 8.5

::critcl::debug symbols memory
#::critcl::config trace on
#::critcl::config lines off

package require critcl::cutil
critcl::cutil::assertions on
critcl::cutil::tracer     on
critcl::cutil::alloc

critcl::ccode {
    TRACE_OFF;
}

# # ## ### ##### ######## #############
## C side - Support code implementing the hashes

critcl::source hashes.tcl

# # ## ### ##### ######## #############
## C/Tcl glue - Command implementations

critcl::source glue.tcl

# # ## ### ##### ######## #############
## Tcl side - Command aggregation into the public API

critcl::tsources policy.tcl

# # ## ### ##### ######## #############
## Make the C pieces ready. Immediate build of the binaries, no deferal.

if {![critcl::load]} {
    error "Building and loading aktive failed."
}

# # ## ### ##### ######## #############
return

# - -- --- ----- -------- -------------
# vim: set sts=4 sw=4 tw=80 et ft=tcl:
#
# Local Variables:
# mode: tcl
# fill-column: 78
# End:
#
