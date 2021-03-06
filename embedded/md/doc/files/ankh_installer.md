
[//000000001]: # (ankh\_install\_guide \- Ankh)
[//000000002]: # (Generated from file 'ankh\_installer\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2021 Andreas Kupries)
[//000000004]: # (Copyright &copy; 2021 Documentation, Andreas Kupries)
[//000000005]: # (ankh\_install\_guide\(n\) 1\.0 doc "Ankh")

<hr> [ <a href="../../../../../../home">Home</a> &#124; <a
href="../../toc.md">Main Table Of Contents</a> &#124; <a
href="../toc.md">Table Of Contents</a> &#124; <a
href="../../index.md">Keyword Index</a> ] <hr>

# NAME

ankh\_install\_guide \- Ankh \- The Installer's Guide

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [Requisites](#section2)

      - [Tcl](#subsection1)

      - [CriTcl](#subsection2)

      - [Kettle](#subsection3)

  - [Build & Installation](#section3)

  - [Bugs, Ideas, Feedback](#section4)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.5  
package require ankh ?1\.0?  

# <a name='description'></a>DESCRIPTION

![](\.\./\.\./image/logo\.png "Ankh") Welcome to Ankh, Andreas Kupries' Hashes\.

The audience of this document is anyone wishing to build the packages, for
either themselves, or others\.

For a developer intending to extend or modify the packages we additionally
provide

  1. *[Ankh \- License](ankh\_license\.md)*\.

  1. *[Ankh \- The Developer's Guide](ankh\_devguide\.md)*\.

Please read *[Ankh \- How To Get The Sources](ankh\_sources\.md)* first, if
that was not done already\. Here we assume that the sources are already available
in a directory of your choice\.

# <a name='section2'></a>Requisites

Before Ankh can be build and used a number of requisites must be installed\.
These are:

  1. The scripting language Tcl\. For details see [Tcl](#subsection1)\.

  1. The __critcl__ package \(C embedding\) for __Tcl__\. For details see
     [CriTcl](#subsection2)\.

  1. The __kettle__ package \(build support\) for __Tcl__\. For details see
     [Kettle](#subsection3)\.

This list assumes that the machine where Ankh is to be installed is essentially
clean\. Of course, if parts of the dependencies listed below are already
installed the associated steps can be skipped\. It is still recommended to read
their sections though, to validate that the dependencies they talk about are
indeed installed\.

## <a name='subsection1'></a>Tcl

As we are building a Tcl package that should be pretty much obvious that a
working Tcl installation is needed, and I will not belabor the point\.

Out of the many use whatever you are comfortable with, as long as it provides
Tcl 8\.5, or higher\.

This may be a Tcl installation provided by your operating system distribution,
from a distribution\-independent vendor, or built by yurself\.

Myself, I used [ActiveState](https://www\.activestate\.com)'s
[ActiveTcl](https://www\.activestate\.com/activetcl) 8\.5 distribution during
development of the binding, as I am most familiar with it\.

*\(Disclosure: I, Andreas Kupries, worked for ActiveState* *until 2015,
maintaining ActiveTcl and TclDevKit for them\)\.*

This distribution can be found at
[ActiveTcl](https://www\.activestate\.com/activetcl)\. Retrieve the archive of
ActiveTcl 8\.5 for your platform and install it as directed by ActiveState\.

Assuming that ActiveTcl got installed I usually run the command

    teacup update

to install all packages ActiveState provides, and the kitchensink, as the
distribution itself usually contains only the most important set of packages\.
This ensures that the dependencies for [CriTcl](#subsection2), and Ankh are
all present, and more\.

If that is not to your liking you have to read the sections for
[CriTcl](#subsection2), and Ankh to determine the exact set of packages
required, and install only these using

    teacup install $packagename

Both __teacup__ commands above assume that ActiveState's TEApot repository
at [https://teapot\.activestate\.com](https://teapot\.activestate\.com) is in
the list of repositories accessible to __teacup__\. This is automatically
ensured for the ActiveTcl distribution\. Others may have to run

    teacup archive add http://teapot.activestate.com

to make this happen\.

For those wishing to build Tcl on their own, its sources can be found at

  - Tcl

    [https://core\.tcl\-lang\.org/tcl](https://core\.tcl\-lang\.org/tcl)

## <a name='subsection2'></a>CriTcl

To build Ankh the tool __critcl__ is required\.

Ankh's build systems accepts it either as an application found in the PATH, or
as a Tcl package available to the __tclsh__ used to run their build &
installation processes\.

Ankh *must* have at least version 3\.1 of __critcl__ itself, and at least
version 1\.0\.3 of __critcl::class__\.

CriTcl's source repository can be found at
[Critcl](https://github\.com/andreas\-kupries/critcl)\.

The relevant repository branch is *master*\.

At the above url is also an explanation on how to build and install CriTcl,
including a list of its dependencies\.

Its instructions will not be repeated here\. If there are problems with their
directions please file a bug against the critcl project, and not Ankh\.

## <a name='subsection3'></a>Kettle

To build Ankh the build support package __kettle__ is required, as is the
accompanying application\.

This package must be available to the __tclsh__ used to run Ankh's build &
installation process\.

Kettle's main source repository can be found at
[https://core\.tcl\-lang\.org/akupries/kettle](https://core\.tcl\-lang\.org/akupries/kettle)\.
Alternate locations are
[https://chiselapp\.com/user/andreas\_kupries/repository/Kettle](https://chiselapp\.com/user/andreas\_kupries/repository/Kettle)
and
[https://github\.com/andreas\-kupries/kettle](https://github\.com/andreas\-kupries/kettle)\.

The relevant repository branch is *trunk*\.

Kettle has a build and installation guide much like this one for Ankh, which can
be found at the above site and explains how to retrieve its sources and build
the package, which dependencies are required, etc\. The direct link to this guide
is
[https://core\.tcl\-lang\.org/akupries/kettle/doc/trunk/embedded/md/doc/files/kettle\_installer\.md](https://core\.tcl\-lang\.org/akupries/kettle/doc/trunk/embedded/md/doc/files/kettle\_installer\.md)\.

Its instructions will not be repeated here\. If there are problems with their
directions please file a bug against the Kettle project, and not Ankh\.

# <a name='section3'></a>Build & Installation

To install Ankh simply run

    /path/to/tclsh8.5 /path/to/ankh/build.tcl install

where "/path/to/tclsh8\.5" is the tclsh of your Tcl installation, and
"/path/to/ankh" the location of the Ankh sources on your system\.

This builds all packages and then places them in a directory where the
__tclsh8\.5__ will find them\.

On Windows you can invoke the file "build\.tcl" with a double\-click\. This will
pop up a small graphical interface for entering the destination and performing
the installation\. This handling of a double\-click is restricted to Windows only
however\.

On unix the same GUI is acessible by invoking "build\.tcl" without any arguments\.

To get help about the methods of "build\.tcl", and their complete syntax, invoke
"build\.tcl" with argument __help__, i\.e\., like

    /path/to/tclsh8.5 /path/to/ankh/build.tcl help

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

Copyright &copy; 2021 Andreas Kupries  
Copyright &copy; 2021 Documentation, Andreas Kupries
