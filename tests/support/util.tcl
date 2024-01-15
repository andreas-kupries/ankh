# -*- tcl -*-
## (c) 2021-2024 Andreas Kupries
# # ## ### ##### ######## ############# #####################
## Utility functions for the tests.

proc vectors {} {
    lappend v 128U      [string repeat U 128]
    lappend v 8digits   [string repeat 1234567890 8]
    lappend v a         a
    lappend v abc       abc
    lappend v alphal    abcdefghijklmnopqrstuvwxyz
    lappend v alphan    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
    lappend v empty     {}
    lappend v m32       {This is message, length=32 bytes}
    lappend v m50       {Suppose the original message has length = 50 bytes}
    lappend v md        {message digest}
    lappend v milla     [string repeat a 1000000]
    lappend v qbfjld    {The quick brown fox jumps over the lazy dog}
    lappend v qbfjld1   {The quick brown fox jumps over the lazy cog}
    lappend v qbfjld2   {The quick brown fox jumps over the lazy eog}
    lappend v qbfjld3   {The quick brown fox jumps over the lazy dof}

    for {set k 0} {$k < 150} {incr k} {
	lappend v a*$k [string repeat a $k]
    }

    # slice vectors direct, for comparison to sliced input

    lappend v thefox { the fox}
    lappend v comes  {here comes the fox}
    lappend v here   {here comes}
    lappend v fox    {he fox}
    lappend v the    { the }

    return $v
}

proc hashes {} {
    lmap {hash _ _} [hash-sizes] { set hash }
}

proc hash-sizes {} {
    return {
	aich        20 160
	blake2b     64 512
	blake2s     32 256
	btih        20 160
	ed2k        16 128
	edonr/224   28 224
	edonr/256   32 256
	edonr/384   48 384
	edonr/512   64 512
	gost12/256  32 256
	gost12/512  64 512
	gost94      32 256
	has160      20 160
	md4         16 128
	md5         16 128
	ripemd160   20 160
	sha1        20 160
	sha2/224    28 224
	sha2/256    32 256
	sha2/384    48 384
	sha2/512    64 512
	sha3/224    28 224
	sha3/256    32 256
	sha3/384    48 384
	sha3/512    64 512
	snefru/128  16 128
	snefru/256  32 256
	tiger       24 192
	tth         24 192
	whirlpool   64 512
    }
}

proc R {h l d} {
    return r:${h}\t${l}\t[binary encode hex ${d}]
}

proc write {path content} {
    set c [open $path wb]
    puts -nonewline $c $content
    close $c
    return $path
}

proc cat {path} {
    set c [open $path r]
    fconfigure $c -encoding binary -translation binary
    set d [read $c]
    close $c
    return $d
}

proc td {} { tcltest::testsDirectory }

proc v {label args} { V $label $args }

proc V {label map} {
    set path [P $label]
    if {[file exists $path]} {
	return [M $map [tcltest::viewFile $path]]
    } else {
	return {}
    }
}
proc M  {map x}  { string map $map $x }
proc M' {x args} { string map $args $x }
proc P  {label}  { return [td]/results/${label} }

# # ## ### ##### ######## ############# #####################
return
