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
inbuild -build-registry inform-public-library/current/catalogue.txt
```
What this does is to build (currently) ten indexing files from templates
in `current/source` to produce the indexes into `current` itself. Specifically,
it turns:

- `current/source/index.html` into `current/index.html`
- `current/source/index-linux.html` into `current/index-linux.html`
- `current/source/index-macos.html` into `current/index-macos.html`
- `current/source/index-windows.html` into `current/index-windows.html`
- `current/source/pl404.html` into `current/pl404.html`
- `current/source/pl404-linux.html` into `current/pl404-linux.html`
- `current/source/pl404-macos.html` into `current/pl404-macos.html`
- `current/source/pl404-windows.html` into `current/pl404-windows.html`
- `current/source/catalogue.txt` into `current/catalogue.txt`
- `current/source/headings.txt` into `current/headings.txt`

The `pl404.html` page is not actually needed on the server, but instead is
used in the apps, to be displayed if the Internet (or the server) is down.

There are different versions for each app in order to customise the CSS.
Windows needs different font choices, MacOS does idiosyncratic things to
make Dark Mode work with the app. The versions with no platform indicated
are generic in the same way that the v9 Inform Public Library page was generic:
i.e., looking sort of okay but not ideal across the board.

The `catalogue.txt` and `headings.txt` files are purely for human convenience,
and aren't needed by either the server or the apps.

The resources in this registry are the final state of the version 9.3 Public
Library as curated by Mark Musante.
