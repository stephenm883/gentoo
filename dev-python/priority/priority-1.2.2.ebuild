# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy)

inherit distutils-r1

DESCRIPTION="A pure-Python implementation of the HTTP/2 priority tree"
HOMEPAGE="http://python-hyper.org/priority https://github.com/python-hyper/priority https://pypi.python.org/pypi/priority"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86"
IUSE="test"

RDEPEND=""

DEPEND="
	test? (
		>=dev-python/pytest-2.9.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-3.4.2[${PYTHON_USEDEP}]
	)
"

python_test() {
	PYTHONPATH="${S}/test:${BUILD_DIR}/lib" py.test -v || die "Tests failed under ${EPYTHON}"
	cd test
}
