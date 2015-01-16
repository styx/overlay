# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils flag-o-matic git-r3

DESCRIPTION="Vim's rebirth for the 21st century"
HOMEPAGE="https://github.com/neovim/neovim"
EGIT_REPO_URI="git://github.com/neovim/neovim.git"

LICENSE="vim"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-lang/perl
  >=dev-libs/libuv-0.11.27
  dev-libs/msgpack
  sys-libs/ncurses"
DEPEND="${RDEPEND}
  dev-lang/luajit
  dev-lua/LuaBitOp
  dev-lua/lpeg
  dev-lua/cmsgpack
  virtual/libiconv
  virtual/libintl"

src_configure() {
  append-flags "-Wno-error -DNDEBUG -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1"
  local mycmakeargs=( -DCMAKE_BUILD_TYPE=Release )
  cmake-utils_src_configure
}
