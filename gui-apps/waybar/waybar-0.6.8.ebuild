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
IUSE="gtk pulseaudio sway"
RESTRICT="mirror"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 s390 ~sh sparc x86"

DEPEND="
	>=dev-libs/libfmt-5.3.0
	>=dev-libs/spdlog-1.3.1
	sway? ( >=gui-wm/sway-1.1.1 )
"

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
	pulseaudio? ( media-sound/pulseaudio )
"

BDEPEND="
"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/${NAME}-${PV} ${WORKDIR}/${PN}-${PV}
}

src_compile() {
	meson ${S}/build
	ninja -C ${S}/build
}

src_install() {
	dobin ${S}/build/waybar
}
