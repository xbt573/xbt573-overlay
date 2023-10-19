# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

case ${PV} in
	*9999)
		inherit git-r3
		EGIT_REPO_URI="https://github.com/xbt573/whalemod"
		;;
	*)
		SRC_URI="https://github.com/xbt573/whalemod/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
		KEYWORDS="~amd64"
		;;
esac

DESCRIPTION="You have been whaled"
HOMEPAGE="https://github.com/xbt573/whalemod"

LICENSE="MIT"

SLOT="0"

src_compile() {
	local modlist=(
		whale
	)

	linux-mod-r1_src_compile
}
