#!/usr/bin/env python

# This script tests that the package mirror at https://github.com/DigitalPrice/depends-sources
# contains all of the packages required to build this version of Zcash.
#
# This script assumes you've just built DP-Wallet, and that as a result of that
# build, all of the dependency packages have been downloaded into the
# depends/sources directory (inside the root of this repository). The script
# checks that all of those files are accessible on the mirror.

import sys
import os
import requests

MIRROR_URL_DIR="https://media.githubusercontent.com/media/DigitalPrice/depends-sources/main/"

try:
    DEPENDS_SOURCES_DIR = os.environ['SOURCES_PATH']
except KeyError:
    DEPENDS_SOURCES_DIR=os.path.realpath(os.path.join(
    os.path.dirname(__file__),
    "..", "..", "depends", "sources"
    ))


def get_depends_sources_list():
    return filter(
	lambda f: os.path.isfile(os.path.join(DEPENDS_SOURCES_DIR, f)),
	os.listdir(DEPENDS_SOURCES_DIR)
    )

for filename in get_depends_sources_list():
    resp = requests.head(MIRROR_URL_DIR + filename)

    print("Checking [" + filename + "] ...")

    if resp.status_code != 200:
	    print("FAIL. File not found on server: ", filename)


print("PASS.")
sys.exit(0)
