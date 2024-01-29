package=libsodium
$(package)_version=1.0.19
$(package)_download_path=https://download.libsodium.org/libsodium/releases
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea
$(package)_dependencies=
$(package)_patches=1.0.15-pubkey-validation.diff 1.0.15-signature-validation.diff
$(package)_config_opts=

define $(package)_set_vars
  $(package)_build_env=DO_NOT_UPDATE_CONFIG_SCRIPTS=1
  ifeq ($(build_os),darwin)
  $(package)_build_env+=MACOSX_DEPLOYMENT_TARGET="$(OSX_MIN_VERSION)"
  $(package)_cc=clang
  $(package)_cxx=clang++
  endif
endef

define $(package)_preprocess_cmds
  patch -p1 < $($(package)_patch_dir)/1.0.15-pubkey-validation.diff && \
  patch -p1 < $($(package)_patch_dir)/1.0.15-signature-validation.diff && \
  cd $($(package)_build_subdir); ./autogen.sh
endef

define $(package)_config_cmds
  $($(package)_autoconf) --enable-static --disable-shared
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
