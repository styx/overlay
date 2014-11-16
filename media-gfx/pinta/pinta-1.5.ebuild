# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/pinta/pinta-1.5_pre20121118.ebuild,v 1.1 2013/03/21 17:03:38 hasufell Exp $

EAPI=5

inherit fdo-mime gnome2-utils mono

DESCRIPTION="Simple Painting for Gtk"
HOMEPAGE="http://pinta-project.com"
SRC_URI="https://github.com/PintaProject/Pinta/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT CC-BY-3.0"
SLOT="0"

COMMON_DEPEND="dev-dotnet/atk-sharp:2
	dev-dotnet/gdk-sharp:2
	dev-dotnet/glib-sharp:2
	dev-dotnet/gtk-sharp:2
	dev-dotnet/mono-addins[gtk]
	dev-dotnet/pango-sharp:2
	dev-lang/mono"
RDEPEND="${COMMON_DEPEND}
	x11-libs/cairo[X]
	x11-libs/gdk-pixbuf[X,jpeg,tiff]
	x11-themes/gnome-icon-theme"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	local i
	if [[ -n "${LINGUAS+x}" ]] ; then
		for i in $(cd "${S}"/po ; echo *.po) ; do
			if ! has ${i%.po} ${LINGUAS} ; then
				sed -i -e "/po\/${i%.po}.po/{N;N;d;}" Pinta.Install.proj || die
			fi
		done
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}