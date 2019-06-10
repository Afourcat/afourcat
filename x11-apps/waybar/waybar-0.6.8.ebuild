# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# 7

EAPI=7

DESCRIPTION="A wayland compatible configurable bar."
NAME="Waybar"
HOMEPAGE="https://github.com/Alexays/Waybar"
SRC_URI="https://github.com/Alexays/${NAME}/archive/${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 s390 ~sh sparc x86"

RDEPEND="
	dev-cpp/gtkmm
	dev-libs/jsoncpp
	dev-libs/libinput
	dev-libs/libsigc++
	dev-libs/wayland
	gui-libs/wlroots
"

RDEPEND="
	${RDEPEND}
"

src_unpack() {
	tar xvf ${PV}.tar.gz
}

src_install() {
	meson build
	ninja -C build
	dobin ./build/waybar
}
