make -C ${PWD}/depends v=1 NO_PROTON=1 HOST=x86_64-apple-darwin18
./autogen.sh
CXXFLAGS="-g0 -O2" \
CONFIG_SITE="$PWD/depends/x86_64-apple-darwin18/share/config.site" ./configure --disable-tests --disable-bench --with-gui=qt5 --disable-bip70
make V=1

./autogen.sh

LDFLAGS="-static-libgcc -static-libstdc++"
CPPFLAGS="-I$PREFIX/include -arch x86_64" LDFLAGS="-L$PREFIX/lib -arch x86_64 -Wl,-no_pie" \

# -Werror should be removed from CPPFLAGS, othewise Qt static plugins determine on ./configure
# step will cause an error and static Qt plugins will not be linked.

CXXFLAGS='-arch x86_64 -I/usr/local/Cellar/gcc\@8/8.3.0/include/c++/8.3.0/ '"-I${PREFIX}/include"' -fwrapv -fno-strict-aliasing -g0 -O2 -Wl,-undefined -Wl,dynamic_lookup' \
./configure --prefix="${PREFIX}" --disable-bip70 --with-gui=qt5 --disable-tests --disable-bench "$HARDENING_ARG" "$LCOV_ARG"

make "$@" V=1 NO_GTEST=1 STATIC=1
