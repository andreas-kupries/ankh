
[//000000001]: # (ankh \- Ankh)
[//000000002]: # (Generated from file 'ankh\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021 Documentation, Andreas Kupries)
[//000000005]: # (ankh\(n\) 0\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh \- Ankh \- API

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Global operations](#section2)

  - [Hash commands](#section3)

  - [Supported Hashes](#section4)

  - [Bugs, Ideas, Feedback](#section5)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.5  
package require ankh ?0\.0?  

[__ak hash version__](#1)  
[__ak hash list__](#2)  
[__ak hash__ __HASH__ __channel__ *channel*](#3)  
[__ak hash__ __HASH__ __path__ *path*](#4)  
[__ak hash__ __HASH__ __string__ *string*](#5)  
[__ak hash__ __HASH__ __size__](#6)  
[__ak hash__ __HASH__ __references__](#7)  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.

This document is the reference manpage for the publicly visible API, i\.e\. the
API a user will see, and use\.

# <a name='section2'></a>Global operations

  - <a name='1'></a>__ak hash version__

    This command returns a string containing the version number of the
    __Ankh__ package\.

  - <a name='2'></a>__ak hash list__

    This command returns a list containing the names of all the hashes supported
    by the __Ankh__ package\. The names are returned in dictionary order\.

# <a name='section3'></a>Hash commands

Each supported hash provides an ensemble command with three methods for hashing
data from an in\-memory string, an open channel, or a file specified by its path
in the filesystem\.

The set of supported hashes is described in the following section\.

  - <a name='3'></a>__ak hash__ __HASH__ __channel__ *channel*

  - <a name='4'></a>__ak hash__ __HASH__ __path__ *path*

  - <a name='5'></a>__ak hash__ __HASH__ __string__ *string*

    These three commands return the __HASH__\-specific digest of the data
    specified by the command arguments\.

    *Attention*: Note that this result is binary data, i\.e\. a Tcl ByteArray
    value\. It is the callers responsibility to encode this digest into any other
    required form, like hex\-digits, or base64, etc\.

    The data to hash is provided either by a *channel* opened for reading, the
    *path* to a file in the filesystem, or an in\-memory *string*\.

  - <a name='6'></a>__ak hash__ __HASH__ __size__

    This command returns the size of digests generated by the __HASH__, in
    bytes\.

  - <a name='7'></a>__ak hash__ __HASH__ __references__

    This command returns a list of informational data about the __HASH__\.

# <a name='section4'></a>Supported Hashes

The package currently supports 18 different hash functions, some configured for
multiple digest sizes, for a total of 30 commands\.

Note that many of the hash functions have descriptions at [RHash @
SourceForge](http://rhash\.sourceforge\.net/hashes\.php)\. Because of that the
descriptions here are even shorter summaries\.

Further note that all phrases like __X supports digests of size A, B, \.\.\.__
should be read to mean that this are the digest sizes supported by the C code
underlying Ankh\. While this matches the allowed/specified digest sizes for many
of the hashes here, it is not true for all\.

  - __aich__

    The *Advanced Intelligent Corruption Handler* comes from the *EDonkey*
    p2p\-network\. It uses SHA\-1 internally\. Digests are 160 bits\.

    See also *[ed2k](\.\./\.\./index\.md\#ed2k)* below\.

  - __blake__

    See [Blake 2 @
    Wikipedia](https://en\.wikipedia\.org/wiki/BLAKE\_\(hash\_function\)\#BLAKE2)
    for details\. Supports digests of 256 and 512 bits\.

  - __btih__

    The *BitTorrent InfoHash* originates, naturally, in the BitTorrent
    network\. Digests are 160 bits\.

  - __ed2k__

    Like *[aich](\.\./\.\./index\.md\#aich)* above *EDonkey 2000* comes from
    the *EDonkey* p2p\-network\. It uses MD\-4 internally\. Digests are 128 bits\.

  - __edonr__

    Defined in 2006 in the article *D\. Gligoroski, S\. Markovski, L\. Kocarev
    "Edon\-R, An Infinite Family of Cryptographic Hash Functions"*\. Supports
    digests of 224, 256, 384, and 512 bits\.

  - __gost12__

  - __gost94__

    These hash functions are from the Russian national standard *GOST R
    34\.11\-94*\. *[gost12](\.\./\.\./index\.md\#gost12)* supports digests of 256
    and 512 bits\. *[gost94](\.\./\.\./index\.md\#gost94)* digests are 256 bits\.

  - __has160__

    Designed in and by Korea, for the *Korean Certificate\-based Digital
    Signature Algorithm* \(KCDSA\)\. Digests have 160 bits\.

  - __md4__

    *Message digest 4* was developed by Ronald L\. Rivest\. See RFC 1320\.
    Digests have 128 bits\.

  - __md5__

    *Message digest 5* is an improved success of MD\-4, also developed by
    Ronald L\. Rivest\. See RFC 1321\. Digests have 128 bits\.

  - __ripemd160__

    The *RACE Integrity Primitives Evaluation Message Digest*\. Digests have
    160 bits\.

  - __sha1__

    The *Secure Hash Algorithm 1* was designed in 1993\. See RFC 3174\. Digests
    are 160 bits\.

  - __sha2__

    *Secure Hash Algorithm 2* is the successor of SHA\-2\. Supports digests of
    224, 256, 384, and 512 bits\.

  - __sha3__

    *Secure Hash Algorithm 3* is the latest in the SHA series\. Based on a
    completely new internal construction than the predecessors\. See *KECCACK*\.
    Supports digests of 224, 256, 384, and 512 bits\.

  - __snefru__

    Made by Ralph Merkle in 1990\. Considered broken\. Also slow\. Supports digests
    of 128 and 256 bits\.

  - __tiger__

    Tiger was developed by Ross Anderson and Eli Biham, with speed on 64bit
    processors in mind\. Digests are 192 bits\.

  - __tth__

    The *Tiger Tree Hash* is based on the
    *[Tiger](\.\./\.\./index\.md\#tiger)* hash above\. It is used by the p2p
    networks *Direct Connect* and *Gnutella*\. Digests are 512 bits\.

  - __whirlpool__

    Comes from *NESSIE*\. Adopted by *ISO/IEC 10118\-3:2004*\. Digests are 512
    bits\.

# <a name='section5'></a>Bugs, Ideas, Feedback

This document, and the package it describes, will undoubtedly contain bugs and
other problems\. Please report such at the [Ankh
Tracker](https://core\.tcl\-lang\.org/akupries/ankh)\. Please also report any
ideas for enhancements you may have for either package and/or documentation\.

# <a name='keywords'></a>KEYWORDS

[aich](\.\./\.\./index\.md\#aich), [bittorrent info
hash](\.\./\.\./index\.md\#bittorrent\_info\_hash),
[blake](\.\./\.\./index\.md\#blake), [btih](\.\./\.\./index\.md\#btih),
[cryptographically secure
hashes](\.\./\.\./index\.md\#cryptographically\_secure\_hashes),
[ed2k](\.\./\.\./index\.md\#ed2k), [edonr](\.\./\.\./index\.md\#edonr),
[gost12](\.\./\.\./index\.md\#gost12), [gost94](\.\./\.\./index\.md\#gost94),
[has160](\.\./\.\./index\.md\#has160), [hash
digests](\.\./\.\./index\.md\#hash\_digests), [md4](\.\./\.\./index\.md\#md4),
[md5](\.\./\.\./index\.md\#md5), [ripemd160](\.\./\.\./index\.md\#ripemd160),
[secure hashes](\.\./\.\./index\.md\#secure\_hashes),
[sha1](\.\./\.\./index\.md\#sha1), [sha2](\.\./\.\./index\.md\#sha2),
[sha3](\.\./\.\./index\.md\#sha3), [snefru](\.\./\.\./index\.md\#snefru),
[tiger](\.\./\.\./index\.md\#tiger), [tth](\.\./\.\./index\.md\#tth),
[whirlpool](\.\./\.\./index\.md\#whirlpool)

# <a name='category'></a>CATEGORY

cryptographically secure hashes

# <a name='copyright'></a>COPYRIGHT

Copyright &copy; 2021 Andreas Kupries  
Copyright &copy; 2021 Documentation, Andreas Kupries