# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GCONF_DEBUG="no"
SCROLLKEEPER_UPDATE="no"

inherit gnome2

DESCRIPTION="Time tracking for the masses, in a GNOME applet"
HOMEPAGE="http://projecthamster.wordpress.com/ http://code.google.com/p/projecthamster/"
SRC_URI="http://projecthamster.googlecode.com/files/${P}.tar.gz"

#license on homepage is out-of-date, was changed to GPL-2 on 2008-04-16
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.5
	>=dev-python/gnome-python-2.10
	>=dev-python/pygobject-2.6
	>=dev-python/pygtk-2.6
	=dev-python/pysqlite-2*
	x11-libs/libXScrnSaver"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	dev-util/pkgconfig
	sys-devel/gettext"

DOCS="AUTHORS ChangeLog NEWS README"
