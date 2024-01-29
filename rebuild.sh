#!/usr/bin/env bash
rm -rf DP-qt-linux
#zcutil/build.sh -j$(nproc)
make clean && make -j$(nproc)
cp src/qt/komodo-qt DP-qt-linux
