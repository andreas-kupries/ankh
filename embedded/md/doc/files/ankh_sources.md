
[//000000001]: # (ankh\_sources \- Ankh)
[//000000002]: # (Generated from file 'ankh\_sources\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021 Documentation, Andreas Kupries)
[//000000005]: # (ankh\_sources\(n\) 1\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh\_sources \- Ankh \- How To Get The Sources

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Source Location](#section2)

  - [Retrieval](#section3)

  - [Source Code Management](#section4)

  - [Bugs, Ideas, Feedback](#section5)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.5  
package require ankh ?1\.0?  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.

The audience of this document is anyone wishing to either have just a look at
Ankh's source code, or build the packages, or to extend and modify them\.

For builders and developers we additionally provide

  1. *[Ankh \- License](ankh\_license\.md)*\.

  1. *[Ankh \- The Installer's Guide](ankh\_installer\.md)*\.

  1. *[Ankh \- The Developer's Guide](ankh\_devguide\.md)*\.

respectively\.

# <a name='section2'></a>Source Location

The official repository for Ankh can be found at
[https://core\.tcl\-lang\.org/akupries/ankh](https://core\.tcl\-lang\.org/akupries/ankh),
with mirrors at
[https://chiselapp\.com/user/andreas\_kupries/repository/ankh](https://chiselapp\.com/user/andreas\_kupries/repository/ankh)
and
[https://github\.com/andreas\-kupries/ankh](https://github\.com/andreas\-kupries/ankh),
in case of trouble with the main location\.

# <a name='section3'></a>Retrieval

Assuming that you simply wish to look at the sources, or build a specific
revision, the easiest way of retrieving it is to:

  1. Log into this site, as "anonymous", using the semi\-random password in the
     captcha\.

  1. Go to the "Timeline"\.

  1. Choose the revision you wish to have and

  1. follow its link to its detailed information page\.

  1. On that page, choose either the "ZIP" or "Tarball" link to get a copy of
     this revision in the format of your choice\.

# <a name='section4'></a>Source Code Management

For the curious \(or a developer\-to\-be\), the sources are managed by the [Fossil
SCM](https://www\.fossil\-scm\.org)\. Binaries for popular platforms can be found
directly at its [download page](https://www\.fossil\-scm\.org/download\.html)\.

With that tool available the full history can be retrieved via:

> fossil clone [https://core\.tcl\-lang\.org/akupries/ankh](https://core\.tcl\-lang\.org/akupries/ankh) ankh\.fossil

followed by

    mkdir ankh
    cd ankh
    fossil open ../ankh.fossil

to get a checkout of the head of the trunk\.

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
