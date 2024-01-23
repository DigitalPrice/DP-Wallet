### Usage

To build dependencies for the current arch+OS:

    make

To build for another arch/OS:

    make HOST=host-platform-triplet

For example:

    make HOST=x86_64-w64-mingw32 -j4

A prefix will be generated that's suitable for plugging into DP's
configure. In the above example, a dir named x86_64-w64-mingw32 will be
created. To use it for DP:

    ./configure --prefix=`pwd`/depends/x86_64-w64-mingw32

Common `host-platform-triplets` for cross compilation are:

- `x86_64-w64-mingw32` for Win64
- `x86_64-apple-darwin` for MacOSX
- `arm-linux-gnueabihf` for Linux ARM
- `x86_64-unknown-linux-gnu` for Linux64

No other options are needed, the paths are automatically configured.

Dependency Options:
The following can be set when running make: make FOO=bar

    SOURCES_PATH: downloaded sources will be placed here
    BASE_CACHE: built packages will be placed here
    SDK_PATH: Path where sdk's can be found (used by OSX)
    FALLBACK_DOWNLOAD_PATH: If a source file can't be fetched, try here before giving up
    NO_WALLET: Don't download/build/cache libs needed to enable the wallet
    NO_UPNP: Don't download/build/cache packages needed for enabling upnp
    DEBUG: disable some optimizations and enable more runtime checking

If some packages are not built, for example `make NO_WALLET=1`, the appropriate
options will be passed to DP's configure. In this case, `--disable-wallet`.

Additional targets:

    download: run 'make download' to fetch all Win64, MacOSX, and Linux64 sources without building them
    download-osx: run 'make download-osx' to fetch all sources needed for MacOSX builds
    download-win: run 'make download-win' to fetch all sources needed for Win64 builds
    download-linux: run 'make download-linux' to fetch all sources needed for Linux64 builds

### Other documentation

- [description.md](description.md): General description of the depends system
- [packages.md](packages.md): Steps for adding packages

