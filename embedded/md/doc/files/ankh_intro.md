
[//000000001]: # (ankh\_introduction \- Ankh)
[//000000002]: # (Generated from file 'ankh\_intro\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021\-2024 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021\-2024 Documentation, Andreas Kupries)
[//000000005]: # (ankh\_introduction\(n\) 1\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh\_introduction \- Ankh \- Introduction

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Related Documents](#section2)

  - [System Architecture](#section3)

  - [Bugs, Ideas, Feedback](#section4)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.6 9  
package require ankh ?1\.0?  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.

# <a name='section2'></a>Related Documents

  1. *[Ankh \- License](ankh\_license\.md)*\.

  1. *[Ankh \- How To Get The Sources](ankh\_sources\.md)*\.

  1. *[Ankh \- The Installer's Guide](ankh\_installer\.md)*\.

  1. *[Ankh \- The Developer's Guide](ankh\_devguide\.md)*\.

  1. *[Ankh \- API](ankh\.md)*

# <a name='section3'></a>System Architecture

The system's structure is not very complicated\.

At the bottom are C sources taking from
[Tcllib](https://core\.tcl\-lang\.org/tcllib) and
[RHash](https://github\.com/rhash/RHash), implementing a variety of
cryptographically secure hash functions\.

Ankh sits on top of that, providing Tcl commands giving access to these hash
functions\.

# <a name='section4'></a>Bugs, Ideas, Feedback

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

Copyright &copy; 2021\-2024 Andreas Kupries  
Copyright &copy; 2021\-2024 Documentation, Andreas Kupries
