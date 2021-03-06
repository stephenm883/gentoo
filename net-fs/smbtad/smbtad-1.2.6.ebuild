# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Data receiver of the SMB Traffic Analyzer project"
HOMEPAGE="https://github.com/hhetter/smbtad"
SRC_URI="http://morelias.org/smbta/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/libdbi
	dev-libs/iniparser:0
	sys-libs/talloc
"
RDEPEND="${DEPEND}
	|| (
		<net-fs/samba-3.6[smbtav2]
		>=net-fs/samba-3.6
	)
"

DOCS=( README AUTHORS )

src_prepare() {
	cmake-utils_src_prepare

	sed -i \
		-e '/CMAKE_C_FLAGS/d' \
		CMakeLists.txt || die
}

src_install() {
	cmake-utils_src_install

	newinitd "${FILESDIR}"/smbtad.rc smbtad
	newconfd dist/smbtad.conf_example smbtad.conf
}
