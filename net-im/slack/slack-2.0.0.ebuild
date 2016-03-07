# Copyright Mikhail Pabalavets 2015

EAPI="5"

inherit eutils unpacker

DESCRIPTION="A messaging app for teams who put robots on Mars"
HOMEPAGE="https://slack.com/"
SRC_URI="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-amd64.deb"

SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="strip mirror"
S="${WORKDIR}"

src_install(){
	insinto /
	doins -r usr
	fperms 755 /usr/share/slack/slack
}
