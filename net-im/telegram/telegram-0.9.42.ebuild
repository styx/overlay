# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils versionator

RESTRICT="strip"

DESCRIPTION="Telegram Desktop Messenger (official client) binary version"
HOMEPAGE="https://tdesktop.com/"
SRC_URI="http://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz"

RESTRICT="mirror"
LICENSE="GPL-3"
IUSE="updater appindicator"
KEYWORDS="~amd64"
INSTALL_DIR="/opt/telegram"
SLOT="0"
RDEPEND="appindicator? (
	x11-libs/gtk+:2
	dev-libs/libappindicator:2
	)"
DEPEND="${RDEPEND}"
S="${WORKDIR}/Telegram"

src_install() {
    insinto "${INSTALL_DIR}"
	insopts -m755
    doins -r Telegram
	if use updater; then
		doins -r Updater
	fi
    make_wrapper "telegram" "${INSTALL_DIR}/Telegram"
    make_desktop_entry "telegram" "Telegram" "telegram" "X-Messenger"
}

