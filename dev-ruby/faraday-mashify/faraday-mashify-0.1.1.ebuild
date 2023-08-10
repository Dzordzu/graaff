# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="faraday-mashify.gemspec"

inherit ruby-fakegem

DESCRIPTION="Faraday middleware for wrapping responses into Hashie::Mash"
HOMEPAGE="https://github.com/sue445/faraday-mashify"
SRC_URI="https://github.com/sue445/faraday-mashify/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	dev-ruby/faraday:2
	dev-ruby/hashie:*
"

all_ruby_prepare() {
	sed -i -e "s:_relative ': './:" ${RUBY_FAKEGEM_GEMSPEC} || die
}
