Changelog
=========

ComputerGenie (28):
      DP
      sync with KO static-experimental
      bump version [0.8.1.5]
      Update release
      slight change
      fix balance
      update release
      fix mirror check
      Start depends fixing updates
      fix fallback
      Back to 2018 so that we can go forward to 2020+
      Convert a sed command to a static patch file.
      Suppress compilation warnings for K&R-style prototypes when building bdb by adding `-Wno-deprecated-non-prototype` to `CFLAGS`.
      Merge #21065: build: make macOS HOST in download-osx generic
      No need to have darwin release num
      Switch to bitcoin's fetch
      tidy packages
      edit depends readme
      tidy depends make(1)
      forgot branding
      add linux std sha to rust make
      backport sodium tests of zcash #4359
      revert crates
      Swap host/build select
      revert bdb
      qt: Add TextWidth() wrapper
      crosschain
      add generated during build to .gitignore

Daira Emma Hopwood (1):
      Suppress link warnings when building bdb by adding `-Wno-unused-command-line-argument` to `LDFLAGS`.

Daira Emma Hopwood (3):
      Error reporting improvements.
      Improve handling of database read errors.
      Declare `CBlockTreeDB::Read*` methods as `const` when they are trivially so.

DeckerSU (712):
      added *.m4 and default Makefile.am
      added doc directory, required by Makefile.am
      added all needed except Makefile.in in src
      added Makefile.am and *.include
      added seco256k1 and univalue with configure scripts needed
      fixed paths on other OS (not Windows)
      removed curl (on linux we should have it internally)
      removed leveldb and changed it on original from komodo repo
      removed libevent
      removed libsnark
      fixed configure and make files, added needed sources and parameters
      fixed stat call, added incude
      added zmq sources, as we have ENABLE_ZMQ in build system
      removed sys folder to avoid conflicts on linux (TODO)
      added run-komodo-for-test.sh, as we have it in build subsystem
      added komodod (console daemon) needed sources
      added bloomfilter.cpp and .h in build subsystem scripts
      [patch] komodo_stateupdate: disable fread
      [patch] std::atomic<bool> fNetworkActive
      [patch] Discover(...) now static as we have it static in net.cpp
      [patch] problems with int64_t when build on Linux
      [patch] some problems with deserialise [!!!], ivestigate it first
      added initial version of Makefile.qt.include
      added missing sources in Makefile.qt.include
      modified build start script, prepare to build with Qt
      [patch] use NetworkIdFromCommandLine() for compare in non-windows OS
      added qt compiled sources as in .git ignore
      added needed files and changes to build komodo-qt
      changes in .gitignore
      [patch] added sys/types.h in policy.h for linux
      [patch] openssl 1.1.0 and HAVE_DECL_EVP_MD_CTX_NEW patch
      activate make to get autobuild when run build.sh from root project dir
      activated depends build in build subsystem + remove unneeded test files
      added missed files for depends building
      add src/config empty folder for build subsystem
      added small README.md
      Merge branch 'master' of ../komodoocean_src_test into Linux
      removed unneeded files
      fix CRLF -> CR
      needed changes in komodod to build with latest merged changes from master
      Hot fix 790833
      added needed deps in Makefile.qt.include to fix Linux build
      added full libcryptoconditions from komodo master
      added cryptoconditions in configure.ac and changed client ver. revision to 15
      added secp256k1 from latest komodo master
      changes in build subsystem for libcryptoconditions
      removed src/libsnark, it was here for some windows hack i guess
      added snark same way as in komodod master
      add zcash folder from komodo master
      libsnark now not a part of packages, it's in src/snark
      new libsnark related changes (need to check again, maybe something missing)
      fopenmp flag also needed for linker
      warning for users using an old method to compile
      added missing Makefile for snark
      Update README.md
      fix build
      Change deprecation height for 1400000
      Change deprecation height for 1400000
      + fix (deprecation height): 1190336+52×7×24×24 = 1400000
      + fix (deprecation height): 1190336+52×7×24×24 = 1400000
      tweak deprecation heights
      tweak deprecation heights
      + useAvailableBalanceButton in sendcoinsentry dialog
      + Komodo colored icons for Linux and Windows
      start using zcash folder from original komodod, without changes
      start using cryptoconditions from original komodod
      cryptoconditions.h file not found fix
      fix build (part #1)
      fix build (part #2)
      fix build (part #3)
      + librustzcash build
      fix build (part #4)
      add -ldl for linking librustzcash
      change main build script name, now it's `zcutil/build.sh`
      change version number to 2.0.15
      update fetch-params.sh
      enable building depends
      ubuntu 18.04 build fix
      increase editzaddress form default width to fit in z-address
      + copyZSendMany[from/to] template context menu on ZAddressBookPage
      revert windows specific fixes with freeing memory on CC enabled chains
      try to fix balance / interest fields in getinfo RPC call
      fix QMetaObject::connectSlotsByName errors in log on copy zsendmany templates actions
      fix z_mergetoaddress rpc call
      display interest and private balance (variant 1)
      display interest and private balance (variant 2)
      request interest only for KMD (assetchains haven't interest)
      fix spacer height in Pending grid row
      fix signal and slot connectiong in sendcoinsdialog
      fix linux build (added new sources in build)
      + sapling and sprout address validator on z-send form
      fix sort of z-addresses with equal balance
      fix sort of t-addresses with equal balance
      fix: don't need to clear all payTo entries when payFrom address changed
      + build optimized version of Komodo-Qt by default (-g0 -O2)
      Merge branch 'Linux-dev' into Linux
      README.md update
      fix payto frame visibility on z-send tab
      + README.md
      build: Add --disable-bip70 configure option
      payment request support (bip70) disabled by default
      + README.md
      README.md update
      fix some signals & slots errors
      komodo_activate_sapling return value fix
      fix gcc-8 / g++-8 build : returning value of some funcs/methods
      fix sproutfunds init
      fix crash happened in some cases by clincking "Z-Send" (comparator fix)
      fix display of payFromAddress QComboBox with many items
      Update build instructions.
      fix forced rescan for ZEX and KMD with ztx in wallet
      add build_linux.sh for static linux build
      SSL should be used by Qt part only if BIP70 enabled
      add Qt deps needed for static build
      debug: check qt static deps (qminimal)
      latest bitcoin_qt.m4 from Bitcoin Core repo
      important fix for PKG_CONFIG_PATH
      order of include QT_DBUS_LIBS and QT_LIBS
      enable deps build
      trying to fix linking with -lfontconfig -lfreetype
      add dev notes
      libzmq 4.2.2-1 -> 4.3.1 update
      windows cross-compile build fix
      Update README-dev.md
      added MacOS patch for further work
      macos link helper script for further work
      macos build fix
      build fix
      Update README.md
      return of build.sh (equal to build-linux.sh)
      fix forced rescan for ZEX and KMD with ztx in wallet
      + convertpassphrase RPC method
      CKomodo... -> CBitcoin ...
      bloomfilter(.cpp,.h) -> bloom(.cpp,.h)
      zmq update (komodod/beta)
      komodo-config.h -> bitcoin-config.h
      + ac
      + compat (note that glibc_compat.cpp needs to be reworked)
      + cryptoconditions copyrights
      + fiat, gtest, gui (komodoku)
      primitives/block_komodo.cpp -> primitives/block.cpp
      hash_komodo.cpp -> hash.cpp
      komodo_komodod.h -> komodo_bitcoind.h
      + cJSON copyrights
      + copyrights
      crosschain_rpc.cpp -> crosschain.cpp
      net_rpc.cpp -> net.cpp
      protocol_rpc.cpp -> protocol.cpp
      + test-komodo, tui
      + wallet: gtest, test
      experimental: LoadBlockIndexDB speed-up for non-LWMAPOS chains
      ignore src/obj/* in git
      fix permissions (cc - makefiles)
      fix Linux build (todo: check multios and cclib)
      attempt to fix cclib build with customcc
      remove dynamically generated build files from git
      remove unneeded files
      fix UTF-8 encoding (rpcdump.cpp)
      fix UTF-8 encoding (rpcwallet.cpp)
      createrawtransaction enchancement
      + rebranding app icons
      copyright_year: 2018 -> 2019
      coords of Komodo Logo pos on Splash
      + rebranding app icons (other version)
      _COPYRIGHT_YEAR: 2018 -> 2019
      + better rectIcon placement
      + platformstyle color: komodo light blue
      ASSETCHAINS_MAX_ERAS 7 support
      + komodo_args: fix cc params (ac_ccactivateht & ac_ccenable)
      fix settting IS_KOMODO_NOTARY
      Port of Hush supply curve to KMD + check for HUSH3 in komodo_commission
      + icons update (add new, save old)
      fix Windows komodo.ico
      Add undocumented -forcecompactdb to force LevelDB compactions
      On-demand chains fix
      fix: pindexOldTip <-> pindexFork mixed up in log output
      [fix] invalidate chain in case it tried to reorg notarized chain
      remove balance column from receiving / sending addresses table
      CVE-2019-16930, CVE-2019-17048 fixes
      Possible fix for crash
      CVE-2017-18350 fix
      + fix windows build
      Remove obsolete warning message.
      Latest KMD checkpoints added.
      Add SSE4 optimized SHA256
      + update README-dev.md
      [fix-candidate] sync from scratch issue
      v0.5.0 port (part 1)
      v0.5.0 port (part 2)
      use kmd metrics art
      update client version to 3.0.0 (bump client-version)
      bump protocol and KMD version
      move opret check into CheckBlock (invalid typecast fix)
      version bump in configure.ac
      Merge pull request #2 from DeckerSU/static-experimental
      Merge pull request #3 from DeckerSU/static-dev
      + add nsis installer configuration [win64]
      libgmp, libsodium, libsnark versions and fetch urls
      libsodium: prevent update config.sub and config.guess from git.savannah.gnu.org
      add boost and sodium versions in log at startup
      bump boost 1.62 -> 1.66
      Merge pull request #4 from DeckerSU/static-experimental-hf
      Merge pull request #5 from DeckerSU/static-dev
      update univalue
      update boost 1.66 -> 1.72
      add missed src/univalue/gen
      update min protocol version
      update ccache 3.3.1 -> 3.7.4
      remove verus seed
      temp remove seeds
      bump build version (3.0.0.1)
      extend length of rpc console input text
      Seeds hostname change
      bump KMD and client version
      Merge pull request #6 from DeckerSU/static-dev
      [zmq] Call va_end() on va_start()ed args.
      copyright_year: 2019 -> 2020
      add opretmintxfee
      add letsdebug rpc template
      bump version and protocol version
      CVE-2018–20586 fix
      rpc: work-around an upstream libevent bug
      remove blackjok3r's wallet filter code
      new implementation of wallet filter
      walletfilter: log into debug.log, instead of stderr
      remove komodo_longestchain() call from BitcoinMiner()
      .gitignore exclude *_7776 chain files
      AcceptToMemoryPool: add/remove debug messages
      remove dead code in init
      limit blockchain progress to a max of 1.000000
      added total downloads badge
      added new wallet picture
      README.md update
      disable assertion when -debug arg is passed
      update boost src
      Merge pull request #7 from DeckerSU/static-experimental
      Merge pull request #8 from DeckerSU/static-dev
      prevent spamming in debug.log with big hex txes in case of expire
      [test] proper removing of txes that violates interest validation from mempool
      DEFAULT_LIMITFREERELAY: move constant values to a single location in code
      move few printouts from stderr to debug.log
      vcalc_sha256 -> CSHA256(): to use hardware acceleration, if available
      enable build of komodo-cli binary
      disable THROW_IF_SYNCING to allow z-rpcs anyway
      TODO: few uncomplete RPCs / patches / fixes to implement
      add komodo unit tests + Makefile.am fixes
      fix notarization test segfault (komodo-test)
      util: CBufferedFile fixes
      disable building unit test by default on Windows and Mac
      added sha256 crypto unit test
      temp disable non-working coin import tests
      Remove template matching and pseudo opcodes
      Do not treat bare multisig outputs as IsMine unless watched
      added unit test for standart scripts
      added multisig tests (gtest)
      Refactor SHA256 code
      Specialized double sha256 for 64 byte inputs
      Add merkle.{h,cpp}, generic merkle root/branch algorithm
      build: Rename --enable-experimental-asm to --enable-asm and enable by default
      __get_cpuid -> GetCPUID
      [test] Add hardware SHA256D64 implementations (from BTC 0.19.x)
      Add AC_LANG_PUSH([C++]) in configure.ac
      Fix Makefile.am
      add merkle root unit test (old and new mechanism)
      BuildMerkleTree -> { BlockMerkleRoot, ComputeMerkleRoot } merkle.cpp
      linux_release_CFLAGS: -O1 -> -O2
      [dev] VSCode params template
      fix removeExpired crash when syncing from scratch
      add missed QR code support
      bump version to 3.0.1.2 (v3.0.1-beta3)
      add loading guts progress on init
      add loading guts progress logging in debug.log
      better logging for checking all blk files + show percentage in ui
      port Qt build changes from Bitcoin upstream
      QNetworkProxy can't be used anymore, since we changed Qt build flags
      disable (comment) komodo_prefetch usage
      fix macos build (#1)
      Merge pull request #9 from DeckerSU/merge-qt-upstream
      Merge pull request #10 from DeckerSU/static-experimental
      Merge pull request #11 from DeckerSU/static-dev
      Update README-dev.md
      update openssl download path
      upgrade openssl (1.1.1a -> 1.1.1f)
      Merge pull request #12 from DeckerSU/static-experimental
      Merge pull request #13 from DeckerSU/static-dev
      Fix network activity tooltip and icon
      net: Avoid duplicate getheaders requests
      contrib -> todo patches
      + Linearize (Python tool)
      fix linearize-hashes defaults
      remove time adjustment
      feat: dpow season 4
      bump KOMODO_VERSION to 0.6.0
      fix copyright symbol encoding (1251 -> utf8)
      bump deprecation height
      Display assetchain (coin) name in main window title
      fix --branch statoc typo
      Merge pull request #15 from DeckerSU/static-experimental
      Merge pull request #16 from DeckerSU/static-dev
      + CountBits in crypto/common.h
      Add asmap utility which queries a mapping
      p2p: supplying and using asmap to improve IP bucketing in addrman
      Return mapped AS in RPC call getpeerinfo and in GUI
      Addrman Google Tests
      add legacy and asmap addrman tests
      when clearing addrman clear mapInfo and mapAddr
      add addrman serialization test
      addrman: Add missing lock in Clear() (CAddrMan)
      gui: debug window -> tab peers elems re-arrange
      depends: tar: Always extract as yourself
      refactor: remove unused header var in GetBlockProof
      Merge branch 'patch-asmap' into static-experimental
      bump versions (3.0.1-beta4, kmd version 0.6.1)
      Merge pull request #17 from DeckerSU/static-experimental
      add display service bits for NSPV, ADDRINDEX and SPENTINDEX
      optional disable nspv
      menu action hotkey for receiving z-addresses [z]
      update getblocktemplate conditions
      update IsNotInSync() conditions
      fetch bdb using https instead of http
      Merge pull request #18 from DeckerSU/static-experimental
      Merge pull request #19 from DeckerSU/static-dev
      fix libsodium-1.0.18.tar.gz download error
      fix libsodium-1.0.18.tar.gz download error
      fix libsodium-1.0.18.tar.gz download error
      remove auto-created file (cryptoconditions/compile)
      remove auto-created file (cryptoconditions/compile)
      remove auto-created file (cryptoconditions/compile)
      Add missing <stdexcept> header for std::invalid_argument
      fix daemon crash issue on getblocktemplate with -disablewallet arg
      Update COPYRIGHT_YEAR in clientversion.h to 2021
      Update _COPYRIGHT_YEAR in configure.ac to 2021
      update WIN libgmp origin
      Update LevelDB to ZCash upstream 514d86817 (v1.20) (#20)
      Support serialization of std::vector<bool>
      fix cJSON* pointer compare with int
      fix return value in hashFingerprintContents
      funcs.mk: override platform specific files and hashes
      rust: upgrade to 1.36 + allow crossplatform build
      native_ccache: upgrade to 3.7.12
      bdb: fix for darwin cross-compile build
      darwin builder gcc/g++ -> clang/clang++ default
      googletest: changes to cross-compile for darwin
      libcurl: darwin cross-compile
      [depends] native_cctools
      librustzcash: right target for darwin cross-compile
      libsnark: changes for darwin cross-compile
      libsnark should be build when cross-compile for darwin
      [depends] fix build flags (todo: re-check this)
      [depends] build native_cctools only when needed
      fix libcurl package configure stage
      fix bdb build on native darwin (TODO: refactor bdb.mk)
      librustzcash: fix native darwin build special case
      remove hardcoded OSX_MIN_VERSION values in recipes
      disable googlemock package building
      Revert "fix return value in hashFingerprintContents"
      qt: Replace objc_msgSend() function calls with the native Objective-C syntax
      fix darwin cross-compile build
      add build-mac-cross.sh script
      fix cleanup (make clean)
      update build scripts for mac-cross, win and mac-native
      fix cleanup libraries
      example of correct adding libcurl to buildsystem
      additional cleanup
      dev notes update
      restore our default CXXFLAGS for win64 build
      remove -std=c11 flag from mingw host
      remove old build scripts
      add compiler optimizations flags (as it was) to MacOS build
      README.md update
      fix libsnark build on native darwin
      openssl_m1.patch (arm_darwin -> darwin64-arm64-cc)
      README.md update
      fix build-mac.sh (darwin native build)
      [depends] funcs.mk: add cmake config env
      [depends] add native_cdrkit package
      .gitignore update
      add Info.plist, extract_strings_qt.py
      add macdeploy stuff
      prepare buildsystem for osx deploy
      add native cdrkit patch
      bump version build
      initial glibc compat patch (more work needed)
      fix "make deploy" dmg creation on native mac
      fix deploy target under windows
      update graphics in share/pixmaps
      Merge pull request #21 from DeckerSU/macos-cross-compile
      Merge pull request #22 from DeckerSU/static-experimental
      Merge pull request #23 from DeckerSU/static-dev
      remove unneeded macos_link_helper.sh
      add DEFAULT_WALLET_DAT variable
      wallet filter: fix mutexes locking order (cs_main, cs_wallet)
      comment notary spam prints
      fix KMD getinfo call for 0.16; use port from -notary conf
      make -notary configurable path to dest coin
      fix strcmp
      return real time offset in getpeerinfo rpc
      cleanwallettransactions: fix typos in JSON output
      Update season 5 pubkeys and constants
      ac_private hltc
      notaryid fix
      ExtractDestination is disabled to have vsolutions size > 1
      bump version 0.7.0
      bump openssl (1.1.1k) and libcurl (7.76.1) versions
      Update Qt 5.9.8 download path (official_releases -> archive)
      update checkpoints for KMD (Komodo)
      fix libcurl build for macos-cross (libgsasl fix)
      fix nLocalServices NODE_NSPV conditional init
      change AC_INIT [bug-report], [tarname], [url]
      Merge pull request #25 from DeckerSU/static-experimental
      Merge pull request #26 from DeckerSU/static-dev
      zcashparams: change sprout files location
      update assetchains definitions (launch params)
      add komodod, komodo-tx and wallet-utility to build system
      add missed bitcoind-res.rc for windows build
      add missed bitcoin-tx-res.rc
      [windeploy] fix binaries strip
      Fix automake warnings when running autogen.sh
      correct integration of libcurl into build system
      remove HAVE_DECL_EVP_MD_CTX_NEW hack in Makefile.qt.include
      cleanup Makefile.qt.include
      update todo.txt
      update .vscode.template/settings.json
      [build] fix qt build on archlinux
      [build] disable staging rust-docs
      Update todo.txt (cross-compile for w64 from archlinux tutorial)
      make RBF checkbox hidden and disable it
      Update todo.txt
      disable debug printout (Sign1)
      Do not pass in command line arguments to QApplication
      Update todo.txt
      Update KMD checkpoints after Medusa HF
      add KomodoOcean managed dns seeder
      fix custom datadir debug message
      fix fAddressIndex/fSpentIndex debug message
      revised dns seeders (remove dead, add new)
      add gcharang's dns seeder
      Update todo.txt
      ecmult_const.h: fix ENABLE_MODULE_MUSIG close statement
      sync cryptoconditions to KomodoPlatform/komodo (master)
      hashFingerprintContents return type fix
      init.cpp: add include for komodo_init
      komodo.h: remove some old commented sources
      miner.cpp: add include for komodo_chosennotary
      remove Marmara CC (0xef) from codebase
      temp revert include changes
      get rid of KOMODO_ZCASH
      Hex Utility Function Cleanup
      fix libbitcoin_common linkage (hex.c)
      add komodo_extern_globals.h
      stop include mini-gmp.c "as is" in komodo_utils.h
      temp add -fPIC for build libbitcoin_server_a (mini-gmp.c)
      revert definition of komodo_mutex in komodo_extern_globals.h
      split of h and cpp [1]
      split of h and cpp [2]
      split of h and cpp [3]
      split of h and cpp [4]
      split of h and cpp [5]
      split of h and cpp [6]
      split of h and cpp [7]
      split of h and cpp [8]
      komodo_jumblr: fix cJSON include
      add cJSON enhancements
      split of h and cpp [9]
      split of h and cpp [10]
      split of h and cpp [11]
      split of h and cpp [12]
      finish split of h and cpp (14 headers done)
      switch to refactored events processing
      printf, fprintf(stderr -> LogPrintf transition
      fix crash on writing an event_notarized
      add clean of libcjson.a
      fix windows build
      komodo_cJSON.c: add forgotten include for strlen, strcpy, strcmp, etc.
      add test_events unit test
      fix build test_events.cpp for Windows
      missing and misordered includes for Windows
      fetch-params scritps rearrange
      change ZcashParams source in NSIS scripts
      bump version to v0.7.0-beta2
      Merge pull request #27 from DeckerSU/static-experimental
      Merge pull request #28 from DeckerSU/static-dev
      move notaries list into komodo_hardfork.h
      add fixed seed nodes
      bump version 0.7.1
      Merge branch 'diff-pr-476' into static-experimental
      Merge pull request #29 from DeckerSU/static-experimental
      Merge pull request #30 from DeckerSU/static-dev
      fix init of event_notarized dest field
      Assure last char of event_notarized::dest is 0
      event_notarized ctor: use strncpy instead of memcpy
      Merge pull request #31 from DeckerSU/patch-event-init-fix
      bump version 0.7.1-beta2
      Merge pull request #32 from DeckerSU/static-experimental
      Merge pull request #33 from DeckerSU/static-dev
      add size_on_disk field in getblockchaininfo output
      CalculateCurrentUsage: add missed lock, switch to range-based for loop
      set default explorer URLs in case if not filled by user
      depends: Qt 5.12.11
      build, qt: Make QWindowsVistaStylePlugin available again
      build: mac bump macOS SDK to 10.15.6 (12.1)
      update todo.txt
      add LogQtInfo to log short info about the used Qt and the host system
      update README.md: new macOS SDK
      variant of native_cctools.mk with clang 10.0.1 for future use
      add dummy package for test/debug purposes
      [build] add cross_toolchain_path var in config.site for future use
      [build] use -isysroot over --sysroot on macOS
      [build] split native_cctools, macOS toolchain bump
      [build] fix gtest, libcurl, libsnark build for MacOS cross-compile
      [build] temp workaround to fix paths in config.site for MacOS cross-compile
      delete combined native_cctools.mk example
      [gui] Allow icon colorization on mac os
      Merge pull request #34 from DeckerSU/qt_5_12_11
      Introduce -maxuploadtarget
      add (max)uploadtarget infos to getnettotals RPC help
      Fix CCheckQueue IsIdle (potential) race condition
      bump copyright year to 2022
      fix NSPV_remoterpc ptr->method fill
      qt: Add privacy feature to Overview page
      CTxMemPool::WriteFeeEstimates: fix version required to read
      bump version to v0.7.1-beta3 (0.7.1.2)
      Merge pull request #37 from DeckerSU/static-experimental
      Merge pull request #38 from DeckerSU/static-dev
      fix boost build with glibc 2.34 on Linux platforms
      removed python-zmq from needed packages list, added bison (yacc)
      Update README.md
      build: fix unoptimized libraries in depends
      build: force windows build make accept args
      [vscode] treat Makefile*.include files as automake
      pow.cpp: redirect few forgotten stderr output to log file
      pow.cpp: make apow related debug messages belongs to pow log category
      add pre-removal unit tests for block/blockindex serialization
      physical remove haraka and verushash sources
      remove verus/haraka stuff from build system
      remove CVerusHashWriter and SerializeVerusHash
      remove nonce primitives
      nNonce: CPOSNonce -> uint256, remove CPOSNonce related methods
      remove CChainPower and partial change of related calls
      cleanup pow.cpp / pow.h, remove everything verus/lwma pos related
      remove CChainPower usage from tests
      more CChainPower() GetHeight/SetHeight removal
      remove VerusStaker and BitcoinMiner_noeq from miner
      missed IsVerusPOSBlock removal and reorg msg fix
      important komodo_block_prg change + more verus things removal
      fix CBlockIndex nHeight initialization (!)
      update haraka removal unit-test with "after" values
      add comment about IsMine
      remove CStakeParams, GetStakeParams, ValidateMatchingStake
      remove unused OPRET_STAKE* identifiers
      remove CLaunchMap related comments (was in VRSC only)
      get rid of ASSETCHAINS_VERUSHASH, ASSETCHAINS_VERUSHASHV1_1
      remove some unused vars, we haven't any cheat cb in Komodo
      get rid of ASSETCHAINS_LWMAPOS and VERUS_* variables
      remove VRSC special cases, add VRSC assertion
      remove fCoinbaseMustBeProtected comment
      remove unused GetKeyID_NoCheck method
      fix help message, we haven't -ac_veruspos anymore
      delete -mint help message
      fix mining condition (don't mine when fGenerate == false)
      more CChainPower() GetHeight removal
      tests build fix: stop using testing::internal::ColoredPrintf
      Refactor komodo_state::NPOINTS
      reenable "-exchange=1"; locktime=0
      Set AA_EnableHighDpiScaling attribute early
      remove unneeded main_old source
      hfnet: change default p2p port to 8880
      introduce nAllowNotariesMineExtraBlockAfterStaleHeight consensus param
      add hf22 validation code with debug logging
      miner: remove unused roundrobin_delay and KOMODO_CHOSEN_ONE
      remove network id == "main" restriction from validation
      miner: apply hf22 rule if applicable
      move nHF22NotariesPriorityRotateDelta to consensus params
      avoid pitfall with static id in lambda
      rename nAllowNotariesMineExtraBlockAfterStaleHeight to nHF22Height
      move interest validation to from CheckBlock to ContextualCheckBlock
      HF22: check interest validation against prev->GetMedianTimePast() + 777
      AcceptToMemoryPool: remove duplicate log message, log txid in case of error
      CreateNewBlock: mempool txes loop optimization
      komodo_notaryvin: code refactoring and optimization
      komodo_notaryvin: get rid of ugly parameter passing via void pointer
      Clarify prevector::erase and avoid swap-to-clear
      add build script for headless servers (without gui)
      fix formatting in debug message (extra/second block allowed case)
      Revert "hfnet: change default p2p port to 8880"
      update nHF22Height as nS6HardforkHeight + ~1 week
      remove unnecessary comment
      s6 mainnet pubkeys and timestamps
      bump version (0.7.2), KOMODO_VERSION (0.7.2) and copyright year
      bump proto version and min proto version
      for staked chains also better to use latest proto bcz of s6
      allow nodes with 170010 proto version to connect
      build: Deduplicate version numbers
      disable diskindex (de)ser test as it depends on PROTOCOL_VERSION
      Merge pull request #40 from DeckerSU/static-experimental
      Merge pull request #41 from DeckerSU/static-dev
      remove autogenerated with lrelease *.qm files from repo
      fix windows build: provide -DHAVE_CONFIG_H in DEFS for windres
      bump client version build
      Merge branch 'static-experimental' into static-dev
      Merge pull request #42 from DeckerSU/static-dev
      log numvalid for a notarisation tx candidate as well
      Avoid SIGSEGV in tromp solver
      Clean up memory on shutdown
      Lock cs_main for TestBlockValidity
      Ensure pindexPrev is not null before mining against it.
      CDBEnv bitdb -> std::shared_ptr<CDBEnv> bitdb(new CDBEnv())
      initial backport of Komodo #559 into our codebase
      remove REQUIRES(cs_main) thread safety attribute from CChain methods
      fix build, correct syntax and other errors after applying #559 changes
      komodo_gateway.cpp: move log into debug.log, instead of console
      komodo_hardfork: avoid build error with CXXFLAGS='-g -O0'
      qt/komodo.cpp -> qt/komodoapp.cpp to avoid conflict with names in gdb
      fix tests build (--enable-tests=yes)
      report about komodostate parse error in messagebox, instead of console
      Qt: fix komodo units display, disable interest display for ACs
      configure libgmp on Linux with --with-pic=yes
      remove unused sources from repo (after #559)
      get rid of LibTomCrypt derived hash implementations
      remove cryptoconditions-config.h.in generated by autoheader
      fix function(s) invokations after inaccurate merge branches
      fix treating std as a label, name it's a variable of std::string type
      more pegs, hush, marmara code removed
      add komodo_interest_validate, komodo_interest unit tests by dimxy
      add interest calculations via CCoinsViewCache::GetValueIn test
      Update Qt 5.12.11 download path (official_releases -> archive)
      Fix AC_CHECK_LIB for gmp
      Merge pull request #43 from DeckerSU/diff-pr-559
      bump version to v0.7.2-beta3 (0.7.2.2)
      Merge pull request #44 from DeckerSU/static-experimental
      Merge pull request #45 from DeckerSU/static-dev
      add alternative link to Xcode needed (12.2-12B45b)
      add z_gettreestate rpc
      remove orchard related output from z_gettreestate help
      bump copyright year
      logging libevent version at startup
      bump libevent to 2.1.12
      update README.md with MacOS cross-compile hints
      fix commas in help of getsnapshot RPC
      add .rc (win) files for wallet-utility, komodo-test
      update .vscode.template
      fix init Windows sockets in komodo-test on Win64 platform
      add clean-help-dev.sh to assist in cleaning worktree from old objects
      secp256k1: fix possible read from uninitialized memory (tmpj)
      Remove mapRequest tracking that just effects Qt display.
      Rate limit the processing of incoming addr messages
      Randomize the order of addr processing
      Add logging and addr rate limiting statistics
      move logging outside the adddresses loop
      Merge pull request #47 from DeckerSU/patch-hotfixes-back-merge
      bump version to v0.7.2-beta4 (0.7.2.3)
      add forgotten linux_cmake_system makefile variable for Linux host
      add rust hashes update script from zcash
      qt: fix missing Cocoa include
      Update README.md (add points about MacOS native build)
      remove infinite sleep on Mac (previously enabled for debug?)
      build: disable libidn2 usage for libcurl
      build: disable libzstd usage for libcurl
      fix write NUL byte to the end of out
      Avoid storing the Equihash solution in a CBlockIndex object once it has been written to the leveldb database.
      fix NSPV_setequihdr, remove accidentally merged metrics
      Merge pull request #49 from DeckerSU/reduce-equihash-solution-memory-new
      txdb: get rid of consistency checks
      bump version to v0.7.2-beta5 (0.7.2.4)
      reduce AUR 5% -> 0.01% after nS7HardforkHeight
      change unit-tests releted to komodo interest reduce
      update DEPRECATION_HEIGHT to 4320000 (S8 approximated time + extra)
      update actual KIP-0001 heights to nS7HardforkHeight
      Merge branch 'static-experimental' into static-dev
      Merge branch 'static-dev' into static
      build: qt 5.15.5 (initial)
      Add missing QPainterPath include
      Merge pull request #50 from DeckerSU/patch-bump-qt-1
      qt: Fix deprecated QCharRef usage
      fix libsnark build with optimisations on gcc/g++ 11.x
      docker environment for build releases (#52)
      bump libcurl to 8.4.0
      update clean-help-dev.sh script
      build: make the build process in docker capable of being interrupted
      depends: update rust to 1.69.0
      build: unify x86_64-apple-darwin host in scripts
      build: fix librustzcash windows build
      build: use Clang 15 for macOS cross-compilation
      update KMD checkpoints
      update assetchains.old, remove old (deprecated) chains
      add events related unit tests
      add NormalKMDLTCNota unit test
      add advanced clear of all variables between tests
      add MIL->KMD notarisation test (3p coin nota test)
      add MARTY->KMD notarisation test (AC nota test in KMD chain)
      add MARTY->KMD notarisation test (AC nota test in MARTY chain)
      enable all tests, add missed checks
      correct opretlen calculations for BIG_ENDIAN
      remove deprecated KV OPRET in assetchains
      fix PhantomOpReturnEvent test
      refactor opret chain search and compare
      more get rid of strcmp in komodo_voutupdate
      get rid of legacy PAX related specific oprets
      remove unneded OtherTest
      limit the scope of ratification transactions to KMD
      komodo_voutupdate: don't try to process staking oprets and notary proofs
      bump version [0.8.1]
      Merge pull request #55 from DeckerSU/static-experimental
      Merge pull request #56 from DeckerSU/static-dev
      komodo_args: fix rpc and p2p port in ACs on MacOS
      tests: add ParseArgumentsTests for komodo_args / chainparams_commandline
      tests: fix ParseArgumentsTests initializer list issue
      tests: KomodoFeatures fix missed override keyword for member- functions
      update README-dev: add valgrind usage example
      tests: fix compatibility of LegacyEvents test with other tests
      test: improve mapBlockIndex cleanup in LegacyEventsTests
      bump version [0.8.1.1]

Henrik Jonsson (1):
      depends: Add 'make clean' and 'make clean-all' rules

Jack Grigg (7):
      txdb: Remove const annotation from blockinfo iterator type
      txdb: Clean up for loop syntax in `WriteBatchSync`
      depends: Fix issue cross-compiling BDB to Windows with Clang 12
      depends: Don't build BDB utilities on macOS
      depends: Update to latest config.guess & config.sub
      Patch libsodium 1.0.15 pubkey validation onto 1.0.18
      Patch libsodium 1.0.15 signature validation onto 1.0.18

Kadan Stadelmann (3):
      [ca333] update S7 key
      bump (min) protocol version
      bump version [0.8.0]

Luke Dashjr (1):
      Optimisation: Store transaction list order in memory rather than compute it every need

Nate Wilcox (1):
      depends: fix a logging bug for multi-archive packages.

Pavel Gushchin (20):
      Merge pull request #1 from DeckerSU/Linux
      Merge pull request #3 from DeckerSU/Linux
      Merge pull request #5 from DeckerSU/Linux
      Merge pull request #7 from DeckerSU/Linux
      Merge pull request #10 from DeckerSU/Linux
      Merge pull request #13 from DeckerSU/Linux
      Merge pull request #24 from DeckerSU/Linux
      Merge pull request #27 from DeckerSU/Linux
      Merge pull request #29 from DeckerSU/Linux
      Merge pull request #31 from DeckerSU/Linux
      Merge pull request #34 from DeckerSU/Linux
      Merge pull request #36 from DeckerSU/Linux
      Merge pull request #38 from DeckerSU/Linux
      Merge pull request #41 from DeckerSU/static-dev
      Merge pull request #42 from DeckerSU/static-dev
      Merge pull request #43 from DeckerSU/static-dev
      Merge pull request #44 from DeckerSU/static
      Merge pull request #45 from DeckerSU/static-dev
      Merge pull request #46 from DeckerSU/static-dev
      Merge pull request #47 from DeckerSU/static-dev

dimxy (3):
      change komodostate file name to komodoevents; fix param to const char* in komodo state function
      fix komodo_eventadd_notarized for KMD symbol proper check, add logging ntz_verify
      fix event tests (cleat state for each case), add check for last nota read from komodoevents

ip-gpu (3):
      Merge of jl777/beta into Komodo-QT
      fixed notification progress
      fixed and updated till 06 of December 2019

ip_gpu (29):
      First stable beta of Komodo QT wallet.
      1. turned on server mode to run RPC queue (for z_sendmany executing) 2. fixed errors in building script for the debug version
      fixed crashes when sending money by console window.
      Merged commits from komodo-master from August 2017 to February 2018.
      - Added new menu element "Receiving z-addresses..." - to display/add new z-addresses - Added column "Balance" in tables with receiving addresses and z-addresses, which displays current balance of addresses with the minimum 1 confirmation
      Merged commits from komodo-master 13-14 Apr 2018.
      Merged commits from komodo-master 15-16 Apr 2018.
      Merged commits from komodo-master 16-17 Apr 2018.
      Merged commit from komodo-master 19 Apr 2018.
      Revert half the windows redundant header fix
      Merged absent commits from komodo-master 20-25 Apr 2018.
      fixed bug
      Merged absent commits from komodo-master 27 Apr - 27 Jun 2018.
      Sapling changes (from 27 June 2017 to 07 December 2018)
      * Merged absent commits from KomodoPlatform/master 06 Dec - 10 Dec 2018.
      fee calculation based on GUI
      - fixed: sometimes it was crashed when checked fingerprints - fixed: GUI did not correctly displayed new generated z-addresses
      fixed sometimes crashing
      fixed loading of z-addresses from wallet
      displaying labels for z-addresses (z-sprout or z-sapling)
      fixed bug when the secondary instance of application in KMD mode hung forever.
      * Merged absent commits from KomodoPlatform/master 11 Dec - 19 Dec 2018.
      fixed incorrect shutdown process (there was some threads without interruption point)
      fixed: - incorrect application shutdown in some cases - added progress of index DB loading on splash screen
      Added new Z-Send menu action (works like z_sendmany)
      Version 0.3.3b - activation of stricter block checks
      fixed application crash while execution of sendmany command in some cases.
      fixed troubles with crashes while execution of sendmany in console.
      fix Readme

jl777 (3):
      Add interest based expiration to CTxMemPool::removeExpired
      Messages
      Update version

smk762 (1):
      Add S7 pubkeys and HF estimate

