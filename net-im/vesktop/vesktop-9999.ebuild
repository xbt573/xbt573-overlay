# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/Vencord/Vesktop"
	inherit git-r3
else
	SRC_URI="
		https://github.com/Vencord/Vesktop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/xbt573/xbt573-overlay/raw/files/vesktop-${PV}-deps.tar.gz
	"
	S="${WORKDIR}/Vesktop-${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Vesktop gives you the performance of web Discord and the comfort of Discord Desktop"
HOMEPAGE="https://github.com/Vencord/Vesktop"
LICENSE="GPL-3"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	net-libs/nodejs
"
RDEPEND="
	x11-libs/libnotify
	x11-misc/xdg-utils
"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
	else
		unpack ${P}.tar.gz
		cd "${S}" && unpack vesktop-${PV}-deps.tar.gz
	fi
}

src_configure() {
	if [[ "${PV}" == *9999* ]]; then
		npm install --legacy-peer-deps
	fi
}

src_compile() {
	npm run build
	npm exec electron-builder -- --dir
}

src_test() {
	npm run lint
	npm run testTypes
}

src_install() {
	dodir /opt/vesktop
	cp -rp dist/linux-unpacked/* "${D}/opt/vesktop"

	newicon static/icon.png vesktop.png
	make_desktop_entry /opt/vesktop/vencorddesktop Vesktop vesktop
}
