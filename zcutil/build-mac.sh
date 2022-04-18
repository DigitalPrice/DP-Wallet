make -C ${PWD}/depends v=1 NO_PROTON=1 HOST=x86_64-apple-darwin20 -j$(nproc --all)
./autogen.sh
CXXFLAGS="-g0 -O2" \
CONFIG_SITE="$PWD/depends/x86_64-apple-darwin20/share/config.site" ./configure --disable-tests --disable-bench --with-gui=qt5 --disable-bip70
make V=1 -j$(nproc --all)
