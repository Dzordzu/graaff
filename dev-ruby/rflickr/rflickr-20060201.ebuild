# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"
MY_P="${PN}-${PV:0:4}.${PV:4:2}.${PV:6:2}"

DESCRIPTION="A Ruby implementation of the Flickr API."
HOMEPAGE="http://rubyforge.org/projects/rflickr"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8.4
	dev-ruby/mime-types"
RDEPEND="${DEPEND}
	dev-ruby/rake"

pkg_postinst() {
	einfo "In order to use this library, you need to have:"
	einfo
	einfo "1. A Yahoo!/Flickr account."
	einfo "2. A Flickr API key."
	einfo
	einfo "Visit http://www.flickr.com/services/api/ for more info."
}
