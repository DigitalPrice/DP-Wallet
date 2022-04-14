#!/usr/bin/env bash
zcutil/build.sh -j$(nproc)

cp src/qt/komodo-qt DP-qt-linux
