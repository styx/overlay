# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/elixir/elixir-1.0.0.ebuild,v 1.1 2014/06/06 21:39:55 hasufell Exp $

EAPI=5

inherit multilib

DESCRIPTION="Elixir programming language"
HOMEPAGE="http://elixir-lang.org"
SRC_URI="https://github.com/elixir-lang/elixir/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 ErlPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/erlang-18"
RDEPEND="${DEPEND}"

src_compile() {
	emake Q=""
}

src_install() {
	emake DESTDIR="${D}" LIBDIR="$(get_libdir)" PREFIX="/usr" install
	dodoc README.md CHANGELOG.md CODE_OF_CONDUCT.md
}
