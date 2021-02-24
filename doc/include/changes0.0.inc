[subsection {Changes for version 0.0}]

[para] In detail:

[list_begin enumerated]
[comment {- - -- --- ----- -------- ------------- ---------------------}]

[enum] This is the first release of Andreas Kupries' Hashes,
       [const Ankh] for short.

[enum] The package provides a basic set of well-known hashes,
       i.e. [const md4], [const md5], [const sha1], [const sha2], and
       [const sha3].

[enum] It further provides a lot more not as well known hashes from
       around the world.

[enum] The [vset rhash] project is the source for most hash
       implementations. The exception is SHA-1, where the old
       implementation used by [vset tcllib/core]'s sha1 module was
       found to be faster.

[comment {- - -- --- ----- -------- ------------- ---------------------}]
[list_end]
