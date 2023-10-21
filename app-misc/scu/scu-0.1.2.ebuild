# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="
	bumpalo@3.12.2
	cfg-if@1.0.0
	either@1.8.1
	js-sys@0.3.63
	libc@0.2.147
	log@0.4.17
	once_cell@1.17.1
	proc-macro2@1.0.58
	quote@1.0.27
	regex-syntax@0.7.1
	regex@1.8.1
	syn@2.0.16
	unicode-ident@1.0.8
	wasm-bindgen-backend@0.2.86
	wasm-bindgen-macro-support@0.2.86
	wasm-bindgen-macro@0.2.86
	wasm-bindgen-shared@0.2.86
	wasm-bindgen@0.2.86
	web-sys@0.3.63
	which@4.4.0
	whoami@1.4.0
"

inherit cargo

DESCRIPTION="Yet another *fetch utility is aimed at informativeness "
HOMEPAGE="https://github.com/omnitix/scu"
SRC_URI="
	https://github.com/omnitix/scu/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"