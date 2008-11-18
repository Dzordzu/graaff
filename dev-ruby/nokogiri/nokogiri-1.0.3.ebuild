# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Nokogiri (é‹¸) is an HTML, XML, SAX, and Reader parser."
HOMEPAGE="http://nokogiri.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/libxml2
	dev-libs/xslt"
DEPEND="${RDEPEND}
	>=dev-ruby/hoe-1.7.0"
