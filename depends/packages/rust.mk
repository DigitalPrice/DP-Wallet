package=rust
# To update the Rust compiler, change the version below and then run the script
# ./contrib/devtools/update-rust-hashes.sh
$(package)_version=1.69.0
$(package)_download_path=https://static.rust-lang.org/dist
$(package)_file_name_linux=rust-$($(package)_version)-x86_64-unknown-linux-gnu.tar.gz
$(package)_sha256_hash_linux=2ca4a306047c0b8b4029c382910fcbc895badc29680e0332c9df990fd1c70d4f
$(package)_file_name_darwin=rust-$($(package)_version)-x86_64-apple-darwin.tar.gz
$(package)_sha256_hash_darwin=9818dab2c3726d63dfbfde12c9273e62e484ef6d6f6e05a6431a3e089c335454
$(package)_file_name_freebsd=rust-$($(package)_version)-x86_64-unknown-freebsd.tar.gz
$(package)_sha256_hash_freebsd=2985d98910b4a1dd336bfc7a1ac3b18082ed917cff097b4db6f0d6602016c289

# Mapping from GCC canonical hosts to Rust targets
# If a mapping is not present, we assume they are identical, unless $host_os is
# "darwin", in which case we assume x86_64-apple-darwin.
$(package)_rust_target_x86_64-pc-linux-gnu=x86_64-unknown-linux-gnu
$(package)_rust_target_x86_64-w64-mingw32=x86_64-pc-windows-gnu

# Mapping from Rust targets to SHA-256 hashes
$(package)_rust_std_sha256_hash_x86_64-unknown-linux-gnu=b6986b4042af7b17fc8f51127018617b32d45cd555c582efa816ac194d4b53df
$(package)_rust_std_sha256_hash_aarch64-unknown-linux-gnu=8f42b40c0a0658ee75ce758652c9821fac7db3fbd8d20f7fb2483ec2c57ee0ac
$(package)_rust_std_sha256_hash_x86_64-apple-darwin=e44d71250dc5a238da0dc4784dad59d562862653adecd31ea52e0920b85c6a7c
$(package)_rust_std_sha256_hash_x86_64-pc-windows-gnu=09ded4a4c27c16aff9c9911640b1bdf6e1172237ce540ed4dc3e166e9438f0d7

define rust_target
$(if $($(1)_rust_target_$(2)),$($(1)_rust_target_$(2)),$(if $(findstring darwin,$(3)),x86_64-apple-darwin,$(if $(findstring freebsd,$(3)),x86_64-unknown-freebsd,$(2))))
endef

define $(package)_set_vars
$(package)_stage_opts=--disable-ldconfig
$(package)_stage_build_opts=--without=rust-docs-json-preview,rust-docs
endef

ifneq ($(canonical_host),$(build))
$(package)_rust_target=$(call rust_target,$(package),$(canonical_host),$(host_os))
$(package)_exact_file_name=rust-std-$($(package)_version)-$($(package)_rust_target).tar.gz
$(package)_exact_sha256_hash=$($(package)_rust_std_sha256_hash_$($(package)_rust_target))
$(package)_build_subdir=buildos
$(package)_extra_sources=$($(package)_file_name_$(build_os))

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_file_name_$(build_os)),$($(package)_file_name_$(build_os)),$($(package)_sha256_hash_$(build_os)))
endef

# Runs from: build dir
define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_sha256_hash_$(build_os))  $($(package)_source_dir)/$($(package)_file_name_$(build_os))" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir $(canonical_host) && \
  tar --strip-components=1 -xf $($(package)_source) -C $(canonical_host) && \
  mkdir buildos && \
  tar --strip-components=1 -xf $($(package)_source_dir)/$($(package)_file_name_$(build_os)) -C buildos && \
  echo "$(package) for $(build): $($(package)_staging_dir)/buildos" && \
  echo "$(package) for $(canonical_host): $($(package)_staging_dir)/$(canonical_host)"
endef

# Runs from: build dir/$(package)_build_subdir
# first install.sh is from buildos for native build_os platform, second it for host_os (target) platform
define $(package)_stage_cmds
  bash ./install.sh --destdir=$($(package)_staging_dir) --prefix=$(build_prefix) $($(package)_stage_opts) $($(package)_stage_build_opts) && \
  ../$(canonical_host)/install.sh --destdir=$($(package)_staging_dir) --prefix=$(build_prefix) $($(package)_stage_opts)
endef
else
# for normal compilation (non-cross)
define $(package)_stage_cmds
  bash ./install.sh --destdir=$($(package)_staging_dir) --prefix=$(build_prefix) $($(package)_stage_opts) $($(package)_stage_build_opts)
endef
endif
