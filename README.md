# inform-public-library
For constructing the server side of the Inform Public Library

The Public Library is presented in the GUI Inform apps as a source for
downloading commonly needed extensions which aren't bundled with the apps.

The PL is housed at a server (currently `emshort.com`), where the crucial
index file is at `emshort.com/pl/index.html`. The GUI apps fetch this index
page, and the user clicks buttons on it which request the apps to download
extension files from URLs further inside.

Until July 2022, the PL was "built" — i.e., the index page constructed —
with a hacky Perl script which worked from a purely textual metadata file
called the "roster". The Perl is all gone now, and instead the registry
is built like so:
```
inbuild -build-registry inform-public-library/pl-v9/catalogue.txt
```
What this does is to build (currently) four indexing files from templates
in `pl-v9/source` to produce the indexes into `pl-v9` itself. Specifically,
it turns:

- `pl-v9/source/index.html` into `pl-v9/index.html`
- `pl-v9/source/pl404.html` into `pl-v9/pl404.html`
- `pl-v9/source/catalogue.txt` into `pl-v9/catalogue.txt`
- `pl-v9/source/headings.txt` into `pl-v9/headings.txt`

The `pl404.html` page is not actually needed on the server, but instead is
used in the apps, to be displayed if the Internet (or the server) is down.

The `catalogue.txt` and `headings.txt` files are purely for human convenience,
and aren't needed by either the server or the apps.

The resources in this registry are the final state of the version 9.3 Public
Library as curated by Mark Musante.

This is a work in progress: next steps are to improve the CSS to work better
in Dark Mode for MacOS and to be less annoying with fonts on Windows, and to
address the issue of how to make the PL useful in world where many extensions
need different versions for Inform v10.1, but where users will still want
access to the v9.3 PL.
