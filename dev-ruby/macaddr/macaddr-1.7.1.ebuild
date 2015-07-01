# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Cross platform mac address determination for ruby"
HOMEPAGE="http://github.com/ahoward/macaddr"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/systemu-2.6.2 =dev-ruby/systemu-2.6*"

all_ruby_prepare() {
	sed -i -e 's/Config/RbConfig/' Rakefile || die
}
