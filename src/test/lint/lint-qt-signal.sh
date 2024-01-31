#!/usr/bin/env bash
#
# Copyright (c) 2018 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.
#
# Check for SIGNAL/SLOT connect style, removed since Qt4 support drop.

export LC_ALL=C

EXIT_CODE=0

OUTPUT=$(git grep -InE '(SIGNAL|, ?SLOT)\(' -- src/qt)
if [[ ${OUTPUT} != "" ]]; then
    echo "Use Qt5 connect style in:"
    echo "$OUTPUT"
    EXIT_CODE=1
fi
OUTPUT=$(git grep -E '(SIGNAL|, ?SLOT)\(' -- src/qt)
if [[ ${OUTPUT} != "" ]]; then
	partone=$(echo "$OUTPUT"| awk '{print $1}')
	for file in $partone; do
    	parttwo=$(echo "$file"| awk '{print $1}')
    	mousepad "${PWD}/${parttwo::-1}"
    done
fi
exit ${EXIT_CODE}
