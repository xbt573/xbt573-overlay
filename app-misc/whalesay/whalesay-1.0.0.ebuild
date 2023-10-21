# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"
inherit cargo

case ${PV} in
	9999*)
		inherit git-r3
		EGIT_REPO_URI="https://github.com/omnitix/whalesay"
		;;
	*)
		SRC_URI="https://github.com/omnitix/whalesay/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
		KEYWORDS="~amd64"
		;;
esac

DESCRIPTION="whale that can say anything you want."
HOMEPAGE="https://github.com/omnitix/whalesay"
SLOT="0"
LICENSE="GPL-3"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}
