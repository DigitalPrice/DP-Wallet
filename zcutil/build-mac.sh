#!/bin/bash
export CC=gcc-8
export CXX=g++-8
export LIBTOOL=libtool
export AR=ar
export RANLIB=ranlib
export STRIP=strip
export OTOOL=otool
export NM=nm

set -eu -o pipefail

if [ "x$*" = 'x--help' ]
then
    cat <<EOF
Usage:

$0 --help
  Show this help message and exit.

$0 [ --enable-lcov ] [ MAKEARGS... ]
  Build Zcash and most of its transitive dependencies from
  source. MAKEARGS are applied to both dependencies and Zcash itself. If
  --enable-lcov is passed, Zcash is configured to add coverage
  instrumentation, thus enabling "make cov" to work.
EOF
    exit 0
fi

# If --enable-lcov is the first argument, enable lcov coverage support:
LCOV_ARG=''
HARDENING_ARG='--disable-hardening'
if [ "x${1:-}" = 'x--enable-lcov' ]
then
    LCOV_ARG='--enable-lcov'
    HARDENING_ARG='--disable-hardening'
    shift
fi

TRIPLET=`./depends/config.guess`
PREFIX="$(pwd)/depends/$TRIPLET"

make "$@" -C ./depends/ V=1 NO_QT=1 NO_PROTON=1

./autogen.sh
LDFLAGS="-static-libgcc -static-libstdc++"
CPPFLAGS="-I$PREFIX/include -arch x86_64" LDFLAGS="-L$PREFIX/lib -arch x86_64 -Wl,-no_pie" \
CXXFLAGS='-arch x86_64 -I/usr/local/Cellar/gcc\@8/8.3.0/include/c++/8.3.0/ '"-I${PREFIX}/include"' -fwrapv -fno-strict-aliasing -g0 -O2 -Wl,-undefined -Wl,dynamic_lookup' \
./configure --prefix="${PREFIX}" --with-gui=no --enable-tests=no "$HARDENING_ARG" "$LCOV_ARG"

make "$@" V=1 NO_GTEST=1 STATIC=1
