
[//000000001]: # (ankh\_devguide \- Ankh)
[//000000002]: # (Generated from file 'ankh\_devguide\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021\-2024 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021\-2024 Documentation, Andreas Kupries)
[//000000005]: # (ankh\_devguide\(n\) 1\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh\_devguide \- Ankh \- The Developer's Guide

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Developing for Ankh](#section2)

      - [Directory structure](#subsection1)

  - [Bugs, Ideas, Feedback](#section3)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.6 9  
package require ankh ?1\.0?  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.

This document is a guide for developers working on Ankh, i\.e\. maintainers fixing
bugs, extending the package's functionality, etc\.

Please read

  1. *[Ankh \- License](ankh\_license\.md)*,

  1. *[Ankh \- How To Get The Sources](ankh\_sources\.md)*, and

  1. *[Ankh \- The Installer's Guide](ankh\_installer\.md)*

first, if that was not done already\. Here we assume that the sources are already
available in a directory of your choice, and that you not only know how to build
and install them, but also have all the necessary requisites to actually do so\.
The guide to the sources in particular also explains which source code
management system is used, where to find it, how to set it up, etc\.

# <a name='section2'></a>Developing for Ankh

## <a name='subsection1'></a>Directory structure

  - Helpers

  - Documentation

      * "doc/"

        This directory contains the documentation sources\. The texts are written
        in *doctools* format\.

      * "embedded/"

        This directory contains the documentation converted to regular manpages
        \(nroff\), Markdown, and HTML\. It is called embedded because these files,
        while derived, are part of the fossil repository, i\.e\. embedded into it\.
        This enables fossil to access and display these files when serving the
        repositories' web interface\. The "Command Reference" link at
        [https://core\.tcl\-lang\.org/akupries/ankh](https://core\.tcl\-lang\.org/akupries/ankh)
        is, for example, accessing the generated Markdown\.

  - Package Code, General structure

      * "ankh\.tcl"

        This is the master file of the package\. Based on __critcl__ \(v3\.1\)
        it contain alls the necessary declarations to build the package\.

      * "policy\.tcl"

        This is the companions to the "ankh\.tcl" file which implements the
        higher\-level interfaces on top of the C\-based primitive operations, and
        determines policies\.

        The documentation \(see "doc/"\) mainly describes the higher\-level API,
        plus the few primitives which are passed through unchanged, i\.e\. without
        getting wrapped into Tcl procedures\.

      * "glue\.tcl"

        Hash command implementations\. Consumes the "hashes\.tcl" utility file\.

      * "hashes\.tcl"

        Utility file containing hash declarations\. These are consumed by
        "glue\.tcl" to control and guide the implementations\.

      * "c/sha1/"

        A copy of the SHA\-1 C implementation used by
        [Tcllib](https://core\.tcl\-lang\.org/tcllib)\. Built as part of Ankh\.

      * "c/rhash/"

        A copy of the [RHash](https://github\.com/rhash/RHash) sources, as of
        commit __314423fb7a__ \(Feb 13, 2021\)\. These sources are maintained
        by Aleksey Kravchenko, and distributed under a zero\-clause BSD license\.
        Built as part of Ankh\.

  - Package Code, Per Package

      * __[Ankh](ankh\.md)__

          + "ankh\.tcl"

          + "glue\.tcl"

          + "hashes\.tcl"

          + "policy\.tcl"

      * __C support__

          + "c/"

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

Copyright &copy; 2021\-2024 Andreas Kupries  
Copyright &copy; 2021\-2024 Documentation, Andreas Kupries
