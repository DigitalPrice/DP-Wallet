PREFIX="$(pwd)/depends/$BUILD/"

HOST="$HOST" BUILD="$BUILD" "$MAKE" "$@" -C ./depends/ V=1
./autogen.sh

./configure --prefix="${PREFIX}" --with-gui=qt5 --disable-bip70 --enable-tests=no --enable-wallet=yes CXXFLAGS='-g0 -O2'

"$MAKE" "$@" V=1
