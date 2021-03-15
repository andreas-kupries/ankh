
[//000000001]: # (ankh\_changes \- Ankh)
[//000000002]: # (Generated from file 'ankh\_changes\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021 Documentation, Andreas Kupries)
[//000000005]: # (ankh\_changes\(n\) 1\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh\_changes \- Ankh \- Changes

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Changes](#section2)

      - [Changes for version 1\.0](#subsection1)

      - [Changes for version 0\.0](#subsection2)

  - [Bugs, Ideas, Feedback](#section3)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.5  
package require ankh ?1\.0?  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.
This document provides an overview of the changes __[Ankh](ankh\.md)__
underwent from version to version\.

# <a name='section2'></a>Changes

## <a name='subsection1'></a>Changes for version 1\.0

In detail:

  1. This is the first release of __Ankh__ considered to be feature
     complete\.

  1. All hash commands now accept two options, __\-offset__ and
     __\-length__\. With these the user can control the slice of the input to
     hash\.

## <a name='subsection2'></a>Changes for version 0\.0

In detail:

  1. This is the first release of Andreas Kupries' Hashes, __Ankh__ for
     short\.

  1. The package provides a basic set of well\-known hashes, i\.e\. __md4__,
     __md5__, __sha1__, __sha2__, and __sha3__\.

  1. It further provides a lot more not as well known hashes from around the
     world\.

  1. The [RHash](https://github\.com/rhash/RHash) project is the source for
     most hash implementations\. The exception is SHA\-1, where the old
     implementation used by [Tcllib](https://core\.tcl\-lang\.org/tcllib)'s
     sha1 module was found to be faster\.

# <a name='section3'></a>Bugs, Ideas, Feedback

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
