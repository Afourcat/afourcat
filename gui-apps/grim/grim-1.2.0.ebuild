# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# 7

EAPI=7

DESCRIPTION="Grab images from a Wayland compositor."
HOMEPAGE="https://wayland.emersion.fr/grim/"
SRC_URI="https://github.com/emersion/grim/releases/download/v${PV}/${PN}-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE="jpeg"
RESTRICT="mirror"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 s390 ~sh sparc x86"

BDEPEND="
	>=dev-util/meson-0.50.1
	>=dev-libs/wayland-1.17.0
	>=x11-libs/cairo-1.16.0-r3
	jpeg? ( >=media-libs/libjpeg-turbo-1.5.3-r2 )
"

src_unpack() {
	unpack ${A}
}

src_compile() {
	meson ${S}/build
	ninja -C ${S}/build
}

src_install() {
	dobin ${S}/build/${PN}
}
