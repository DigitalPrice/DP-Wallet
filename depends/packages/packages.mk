rust_crates := \
  crate_aes \
  crate_aesni \
  crate_aes_soft \
  crate_arrayvec \
  crate_bitflags \
  crate_bit_vec \
  crate_blake2_rfc \
  crate_block_cipher_trait \
  crate_byte_tools \
  crate_byteorder \
  crate_constant_time_eq \
  crate_crossbeam \
  crate_digest \
  crate_fpe \
  crate_fuchsia_zircon \
  crate_fuchsia_zircon_sys \
  crate_futures_cpupool \
  crate_futures \
  crate_generic_array \
  crate_lazy_static \
  crate_libc \
  crate_nodrop \
  crate_num_bigint \
  crate_num_cpus \
  crate_num_integer \
  crate_num_traits \
  crate_opaque_debug \
  crate_rand \
  crate_stream_cipher \
  crate_winapi \
  crate_typenum \
  crate_winapi_i686_pc_windows_gnu \
  crate_winapi_x86_64_pc_windows_gnu

ifeq ($(build_os),darwin)
	zcash_packages := libsnark libgmp libsodium
else
	zcash_packages := libgmp libsodium
endif

qt_linux_packages := expat libxcb xcb_proto libXau xproto freetype fontconfig libxkbcommon libxcb_util libxcb_util_render libxcb_util_keysyms libxcb_util_image libxcb_util_wm
qt_native_packages := native_protobuf
qt_packages := qt qrencode protobuf

packages := boost openssl libevent zeromq $(zcash_packages) googletest libcurl # googlemock

rust_packages := rust $(rust_crates) librustzcash

native_packages := native_ccache

wallet_packages := bdb

ifneq ($(build_os),darwin)
	darwin_native_packages += native_cctools native_libtapi native_cdrkit
	ifeq ($(strip $(FORCE_USE_SYSTEM_CLANG)),)
		darwin_native_packages += native_clang
	endif
	ifeq ($(host_os),darwin)
		packages += libsnark
	endif
endif

# all non-appending assignments should be simple
# qt assignments should be rolled into the non-qt assignments in a qt-only repo; but, that's for later
