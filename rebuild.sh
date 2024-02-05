#!/usr/bin/env bash
rm -rf src/qt/komodo-qt komodo-qt
#zcutil/build.sh "$@"
make "$@"
cp src/qt/komodo-qt komodo-qt
