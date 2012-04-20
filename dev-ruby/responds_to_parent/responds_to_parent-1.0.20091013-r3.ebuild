# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="Adds responds_to_parent to your controller to respond to the parent document of your page."
HOMEPAGE="http://github.com/markcatley/responds_to_parent"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

# Tests require additional dependencies.
RESTRICT="test"

RUBY_PATCHES=( "${P}-rails3.patch" )

all_ruby_prepare() {
	# Apply ugly hack to work around the effects of the XSS plugin for
	# Rails 2.3.
#	sed -i -e 's/response.body/String.new(response.body)/' lib/responds_to_parent/action_controller.rb || die
echo
}
