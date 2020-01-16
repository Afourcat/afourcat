# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# 7

EAPI=7

inherit user git-r3

DESCRIPTION="Redshift adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less if you are working in front of the screen at night."
HOMEPAGE="http://jonls.dk/redshift/"
EGIT_REPO_URI="https://github.com/minus7/redshift.git"

LICENSE="MIT"
SLOT="HEAD"
IUSE=""
RESTRICT="mirror"
KEYWORDS=""

src_configure() {
	echo "${PV} ${PN}"
	${S}/bootstrap
	${S}/configure
}

src_compile() {
	make -C ${S}
}

src_install() {
	dobin ${S}/src/redshift
	dobin ${S}/src/redshift-gtk/redshift-gtk
}
