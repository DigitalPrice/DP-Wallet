#!/usr/bin/env bash
#
# Copyright (c) 2018 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

#grep -rlE 'komodostrings.cpp' | xargs sed -i "s/komodostrings/bitcoinstrings/g"
#mv qt/komodostrings.cpp qt/bitcoinstrings.cpp
#grep -rl 'KomodoUnit' . | xargs sed -i "s/KomodoUnit/BitcoinUnit/g"
#grep -rlE 'komodounits.(cpp|h)' | xargs sed -i "s/komodounits/bitcoinunits/g"
#mv qt/komodounits.cpp qt/bitcoinunits.cpp && mv qt/komodounits.h qt/bitcoinunits.h
#grep -rlE 'komodooceangui.h' | xargs sed -i "s/komodooceangui.h/bitcoingui.h/g"
#grep -rlE 'komodooceangui.cpp' | xargs sed -i "s/komodooceangui.cpp/bitcoingui.cpp/g"
#mv qt/komodooceangui.cpp qt/bitcoingui.cpp && mv qt/komodooceangui.h qt/bitcoingui.h
#grep -rlE 'komodoaddressvalidator.h' | xargs sed -i "s/komodoaddressvalidator.h/bitcoinaddressvalidator.h/g"
#grep -rlE 'komodoaddressvalidator.cpp' | xargs sed -i "s/komodoaddressvalidator.cpp/bitcoinaddressvalidator.cpp/g"
#mv qt/komodoaddressvalidator.cpp qt/bitcoinaddressvalidator.cpp && mv qt/komodoaddressvalidator.h qt/bitcoinaddressvalidator.h
#grep -rlE 'komodoamountfield.h' | xargs sed -i "s/komodoamountfield.h/bitcoinamountfield.h/g"
#grep -rlE 'komodoamountfield.cpp' | xargs sed -i "s/komodoamountfield.cpp/bitcoinamountfield.cpp/g"
#grep -rlE 'komodoamountfield.moc' | xargs sed -i "s/komodoamountfield.moc/bitcoinamountfield.moc/g"
#mv qt/komodoamountfield.cpp qt/bitcoinamountfield.cpp && mv qt/komodoamountfield.h qt/bitcoinamountfield.h
#grep -rlE 'komodoapp.cpp' | xargs sed -i "s/komodoapp.cpp/bitcoin.cpp/g"
#grep -rlE 'komodoapp.moc' | xargs sed -i "s/komodoapp.moc/bitcoin.moc/g"
#mv qt/komodoapp.cpp qt/bitcoin.cpp


export LC_ALL=C

EXIT_CODE=0

OUTPUT=$(git grep -InE 'komodo(addressvalidator|amountfield|app|oceangui|strings|units).(cpp|h)' -- src/)
if [[ ${OUTPUT} != "" ]]; then
	filelines=$(echo "$OUTPUT" | wc -l)
    echo "Found file branding in:"
    echo "$OUTPUT"
    EXIT_CODE=1
fi
OUTPUT=$(git grep -InE 'KomodoUnit(s)' -- src/)
if [[ ${OUTPUT} != "" ]]; then
	unitlines=$(echo "$OUTPUT" | wc -l)
    echo "Found unit branding in:"
    echo "$OUTPUT"
    EXIT_CODE=1
fi
exit ${EXIT_CODE}
