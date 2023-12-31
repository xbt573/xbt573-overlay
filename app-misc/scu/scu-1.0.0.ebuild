# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="
	regex-syntax@0.7.1
	regex@1.8.1
"

inherit cargo

DESCRIPTION="Yet another *fetch utility is aimed at informativeness"
HOMEPAGE="https://github.com/omnitix/scu"
SRC_URI="
	https://github.com/omnitix/scu/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"
