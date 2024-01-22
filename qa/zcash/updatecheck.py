#!/usr/bin/env python3
#
# This script checks for updates to zcashd's dependencies.
#
# The SOURCE_ROOT constant specifies the location of the zcashd codebase to
# check.
#
# All dependencies must be specified inside the get_dependency_list() function
# below. A dependency is specified by:
#
#   (a) A way to fetch a list of current releases.
#
#       This is usually regular-expression-based parsing of GitHub tags, but
#       might otherwise parse version numbers out of the project's webpage.
#
#	GitHub tag regexps can be tested by specifying test cases in the third
#	argument to GithubTagReleaseLister's constructor.
#
#   (b) A way to fetch the currently-used version out of the source tree.
#
#	This is typically parsed out of the depends/packages/*.mk files.
#
# If any dependency is found to be out-of-date, or there are un-accounted-for
# .mk files in depends/packages, this script will exit with
# a nonzero status. The latter case would suggest someone added a new dependency
# without adding a corresponding entry to get_dependency_list() below.
#
# To test the script itself, run it with --functionality-test as the only
# argument. This will exercise the full functionality of the script, but will
# only return a non-zero exit status when there's something wrong with the
# script itself, for example if a new file was added to depends/packages/ but
# wasn't added to this script.

import requests
import os
import re
import sys
import xdg
import datetime

SOURCE_ROOT = os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "..")

def get_dependency_list():
    dependencies = [
        Dependency("bdb",
            BerkeleyDbReleaseLister(),
            DependsVersionGetter("bdb")),
        Dependency("boost",
            GithubTagReleaseLister("boostorg", "boost", "^boost-(\d+)\.(\d+)\.(\d+)$",
                { "boost-1.69.0": (1, 69, 0), "boost-1.69.0-beta1": None }),
            DependsVersionGetter("boost")),
        Dependency("googletest",
            GithubTagReleaseLister("google", "googletest", "^release-(\d+)\.(\d+)\.(\d+)$",
                { "release-1.8.1": (1, 8, 1) }),
            DependsVersionGetter("googletest")),
        # libc++ matches the Clang version
        Dependency("libcxx",
            GithubTagReleaseLister("llvm", "llvm-project", "^llvmorg-(\d+)\.(\d+).(\d+)$",
                { "llvmorg-11.0.0": (11, 0, 0), "llvmorg-9.0.1-rc3": None}),
            DependsVersionGetter("native_clang")),
        Dependency("libevent",
            GithubTagReleaseLister("libevent", "libevent", "^release-(\d+)\.(\d+)\.(\d+)-stable$",
                { "release-2.0.22-stable": (2, 0, 22), "release-2.1.9-beta": None }),
            DependsVersionGetter("libevent")),
        Dependency("libsodium",
            GithubTagReleaseLister("jedisct1", "libsodium", "^(\d+)\.(\d+)\.(\d+)$",
                { "1.0.17": (1, 0, 17) }),
            DependsVersionGetter("libsodium")),
        # b2 matches the Boost version
        Dependency("native_b2",
            GithubTagReleaseLister("boostorg", "boost", "^boost-(\d+)\.(\d+)\.(\d+)$",
                { "boost-1.69.0": (1, 69, 0), "boost-1.69.0-beta1": None }),
            DependsVersionGetter("boost")),
        Dependency("native_ccache",
            GithubTagReleaseLister("ccache", "ccache", "^v?(\d+)\.(\d+)(?:\.(\d+))?$",
                { "v3.5.1": (3, 5, 1), "v3.6": (3, 6)}),
            DependsVersionGetter("native_ccache")),
        Dependency("native_clang",
            GithubTagReleaseLister("llvm", "llvm-project", "^llvmorg-(\d+)\.(\d+).(\d+)$",
                { "llvmorg-11.0.0": (11, 0, 0), "llvmorg-9.0.1-rc3": None}),
            DependsVersionGetter("native_clang")),
        Dependency("rust",
            GithubTagReleaseLister("rust-lang", "rust", "^(\d+)\.(\d+)(?:\.(\d+))?$",
                { "1.69.0": (1, 69, 0), "0.9": (0, 9) }),
            DependsVersionGetter("rust")),
        Dependency("zeromq",
            GithubTagReleaseLister("zeromq", "libzmq", "^v(\d+)\.(\d+)(?:\.(\d+))?$",
                { "v4.3.1": (4, 3, 1), "v4.2.0-rc1": None }),
            DependsVersionGetter("zeromq")),
        Dependency("leveldb",
            GithubTagReleaseLister("google", "leveldb", "^v?(\d+)\.(\d+)$",
                { "v1.13": (1, 13), "1.23": (1, 23) }),
            LevelDbVersionGetter()),
        Dependency("univalue",
            GithubTagReleaseLister("bitcoin-core", "univalue", "^v(\d+)\.(\d+)\.(\d+)$",
                { "v1.0.1": (1, 0, 1) }),
            UnivalueVersionGetter()),
    ]

    return dependencies

def parse_token():
    token_path = os.path.realpath(os.path.join(SOURCE_ROOT, ".updatecheck-token"))
    if not os.path.exists(token_path):
        token_path = os.path.join(xdg.xdg_data_home(), "zcash/updatecheck/token")
    try:
        with open(token_path, encoding='utf8') as f:
            token = f.read().strip()
            return token.split(":")[-1]
    except:
        print("You are missing a GitHub API token. This script will probably still work, but")
        print("you are more likely to hit an API rate limit. Create a file named")
        print(token_path)
        print("containing the token to silence this warning.")
        return ()

token = parse_token()

class Version(list):
    def __init__(self, version_tuple):
        for part in version_tuple:
            if part: # skip None's which can come from optional regexp groups
                if str(part).isdigit():
                    self.append(int(part))
                else:
                    self.append(part)

    def __str__(self):
        return '.'.join(map(str, self))

    def __hash__(self):
        return hash(tuple(self))

    def __gt__(self, other):
        if type(self) != type(other):
            raise TypeError

        # If one of the versions is a commit hash and the other is not, treat the commit
        # hash as being newer (as it indicates we are pinning a specific revision).
        self_is_commit_hash = len(self) == 1 and len(self[0]) == 40
        other_is_commit_hash = len(other) == 1 and len(other[0]) == 40
        if other_is_commit_hash:
            return False
        if self_is_commit_hash:
            return True

        return super().__gt__(other)

class Dependency:
    def __init__(self, name, release_lister, current_getter):
        self.name = name
        self.release_lister = release_lister
        self.current_getter = current_getter
        self.cached_known_releases = None

    def current_version(self):
        return self.current_getter.current_version()

    def known_releases(self):
        if self.cached_known_releases is None:
            self.cached_known_releases = sorted(self.release_lister.known_releases())
        return self.cached_known_releases

    def released_versions_after_current_version(self):
        current_version = self.current_version()
        releases_after_current = []

        for release in self.known_releases():
            if release > current_version:
                releases_after_current.append(release)

        return releases_after_current

    def is_up_to_date(self):
        return len(self.released_versions_after_current_version()) == 0

class GithubTagReleaseLister:
    def __init__(self, org, repo, regex, testcases={}):
        self.org = org
        self.repo = repo
        self.regex = regex
        self.testcases = testcases

        for tag, expected in testcases.items():
            match = re.match(self.regex, tag)
            if (expected and not match) or (match and not expected) or (match and Version(match.groups()) != list(expected)):
                groups = str(match.groups())
                raise RuntimeError("GitHub tag regex test case [" + tag + "] failed, got [" + groups + "].")

    def known_releases(self):
        release_versions = []
        all_tags = self.all_tag_names()

        # sanity check against the test cases
        for tag, expected in self.testcases.items():
            if tag not in all_tags:
                raise RuntimeError("Didn't find expected tag [" + tag + "].")

        for tag_name in all_tags:
            match = re.match(self.regex, tag_name)
            if match:
                release_versions.append(Version(match.groups()))

        return release_versions

    def all_tag_names(self):
        url = "https://api.github.com/repos/" + safe(self.org) + "/" + safe(self.repo) + "/git/refs/tags"
        auth = {}
        if token:
            auth = { 'Authorization': 'Bearer ' + token }
        r = requests.get(url, headers=auth)
        if r.status_code != 200:
            print("API request failed (error %d)" % (r.status_code,), file=sys.stderr)
            print(r.text, file=sys.stderr)
            raise RuntimeError("Request to GitHub tag API failed.")
        json = r.json()
        return list(map(lambda t: t["ref"].split("/")[-1], json))

class BerkeleyDbReleaseLister:
    def known_releases(self):
        url = "https://www.oracle.com/database/technologies/related/berkeleydb-downloads.html"
        r = requests.get(url)
        if r.status_code != 200:
            print("API request failed (error %d)" % (r.status_code,), file=sys.stderr)
            print(r.text, file=sys.stderr)
            raise RuntimeError("Request to Berkeley DB download directory failed.")
        page = r.text

        # We use a set because the search will result in duplicates.
        release_versions = set()
        for match in re.findall("berkeleydb/html/changelog_(\d+)_(\d+)_(\d+).html", page):
            release_versions.add(Version(match))

        if len(release_versions) == 0:
            raise RuntimeError("Missing expected version from Oracle web page.")

        return list(release_versions)

class DependsVersionGetter:
    def __init__(self, name):
        self.name = name

    def current_version(self):
        mk_file_path = os.path.join(SOURCE_ROOT, "depends", "packages", safe_depends(self.name) + ".mk")
        mk_file = open(mk_file_path, 'r', encoding='utf8').read()

        regexp_whitelist = [
            "package\)_default_version=(\d+)\.(\d+)\.(\d+)$",
            "package\)_version=(\d+)\.(\d+)\.(\d+)$",
            "package\)_version=(\d+)\.(\d+)$",
            "package\)_version=(\d+)_(\d+)_(\d+)$",
            "package\)_version=(\d+)\.(\d+)\.(\d+)([a-z])$",
            "package\)_version=([0-9a-f]{40})$",
        ]

        current_version = None

        for regexp in regexp_whitelist:
            match = re.search(regexp, mk_file, re.MULTILINE)
            if match:
                current_version = Version(match.groups())

        if not current_version:
            raise RuntimeError(
                "Couldn't parse version number from depends %s.mk file." % (safe_depends(self.name),)
            )

        return current_version

class LevelDbVersionGetter:
    def current_version(self):
        header_path = os.path.join(SOURCE_ROOT, "src", "leveldb", "include", "leveldb", "db.h")
        header_contents = open(header_path, 'r', encoding='utf8').read()

        match = re.search("kMajorVersion\s*=\s*(\d+);\s*.*kMinorVersion\s*=\s*(\d+);\s*$", header_contents, re.MULTILINE)
        if match:
            return Version(match.groups())
        else:
            raise RuntimeError("Couldn't parse LevelDB's version from db.h")

class UnivalueVersionGetter:
    def current_version(self):
        configure_path = os.path.join(SOURCE_ROOT, "src", "univalue", "configure.ac")
        configure_contents = open(configure_path, 'r', encoding='utf8').read()

        match = re.search("AC_INIT.*univalue.*\[(\d+)\.(\d+)\.(\d+)\]", configure_contents)
        if match:
            return Version(match.groups())
        else:
            raise RuntimeError("Couldn't parse univalue's version from its configure.ac")

class PostponedUpdates():
    def __init__(self):
        self.postponedlist = dict()

        postponedlist_path = os.path.join(
            os.path.dirname(__file__),
            "postponed-updates.txt"
        )

        file = open(postponedlist_path, 'r', encoding='utf8')
        for line in file.readlines():
            stripped = re.sub('#.*$', '', line).strip()
            if stripped != "":
                match = re.match('^(\S+)\s+(\S+)\s+(\S+)$', stripped)
                if match:
                    postponed_name = match.groups()[0]
                    postponed_version = Version(match.groups()[1].split("."))
                    postpone_expiration = datetime.datetime.strptime(match.groups()[2], '%Y-%m-%d')
                    if datetime.datetime.utcnow() < postpone_expiration:
                        self.postponedlist[(postponed_name, str(postponed_version))] = True
                else:
                    raise RuntimeError("Could not parse line in postponed-updates.txt:" + line)


    def is_postponed(self, name, version):
        return (name, str(version)) in self.postponedlist

def safe(string):
    if re.match('^[a-zA-Z0-9_-]*$', string):
        return string
    else:
        raise RuntimeError("Potentially-dangerous string encountered.")

def safe_depends(string):
    if re.match('^[a-zA-Z0-9._-]*$', string):
        return string
    else:
        raise RuntimeError("Potentially-dangerous string encountered.")

def print_row(name, status, current_version, known_versions):
    COL_FMT_LARGE = "{:<35}"
    COL_FMT_SMALL = "{:<18}"
    print(COL_FMT_LARGE.format(name) +
            COL_FMT_SMALL.format(status) +
            COL_FMT_SMALL.format(current_version) +
            COL_FMT_SMALL.format(known_versions))

def main():
    # Get a list of all depends-system dependencies so we can verify that we're
    # checking them all for updates.
    unchecked_dependencies = [f[:-3] for f in os.listdir(os.path.join(SOURCE_ROOT, "depends", "packages")) if f.endswith(".mk")]

    untracked = [
        # packages.mk is not a dependency, it just specifies the list of them all.
        "packages",
        # This package doesn't have conventional version numbers
        "native_cctools",
        # This package is pinned specifically for Arch.
        #"native_libtinfo",
    ]

    print_row("NAME", "STATUS", "CURRENT VERSION", "NEWER VERSIONS")

    status = 0
    for dep in untracked:
        print_row(dep, "skipped", "", "")
        if dep in unchecked_dependencies:
            unchecked_dependencies.remove(dep)
        else:
            print("Error: Please remove " + dep + " from the list of unchecked dependencies.")
            status = 3

    # Exit early so the problem is clear from the output.
    if status != 0:
        sys.exit(status)

    deps = get_dependency_list()
    postponed = PostponedUpdates()
    for dependency in deps:
        if dependency.name in unchecked_dependencies:
            unchecked_dependencies.remove(dependency.name)
        if dependency.is_up_to_date():
            print_row(
                dependency.name,
                "up to date",
                str(dependency.current_version()),
                "")
        else:
            # The status can either be POSTPONED or OUT OF DATE depending
            # on whether or not all the new versions are whitelisted.
            status_text = "POSTPONED"
            newver_list = "["
            for newver in dependency.released_versions_after_current_version():
                if postponed.is_postponed(dependency.name, newver):
                    newver_list += str(newver) + " (postponed),"
                else:
                    newver_list += str(newver) + ","
                    status_text = "OUT OF DATE"
                    status = 1

            newver_list = newver_list[:-1] + "]"

            print_row(
                dependency.name,
                status_text,
                str(dependency.current_version()),
                newver_list
            )

    if len(unchecked_dependencies) > 0:
        unchecked_dependencies.sort()
        print("WARNING: The following dependencies are not being checked for updates by this script: " + ', '.join(unchecked_dependencies))
        sys.exit(2)

    if len(sys.argv) == 2 and sys.argv[1] == "--functionality-test":
        print("We're only testing this script's functionality. The exit status will only be nonzero if there's a problem with the script itself.")
        sys.exit(0)

    if status == 0:
        print("All non-Rust dependencies are up-to-date or postponed.")
    elif status == 1:
        print("Release is BLOCKED. There are new dependency updates that have not been postponed.")

    print("""
You should also check the Rust dependencies using cargo:

  cargo install cargo-upgrades cargo-audit
  cargo upgrades
  cargo audit
""")
    if status == 0:
        print("After checking those, you'll be ready for release! :-)")

    sys.exit(status)

main()
