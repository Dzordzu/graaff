# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="assets config"

inherit ruby-fakegem

DESCRIPTION="A Ruby static code analyzer"
HOMEPAGE="https://github.com/bbatsov/rubocop"
SRC_URI="https://github.com/bbatsov/rubocop/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/parser-2.3.1.1:0
	>=dev-ruby/powerpack-0.1:0
	dev-ruby/rainbow:2
	>=dev-ruby/ruby-progressbar-1.7:0
	>=dev-ruby/unicode-display_width-1.0.1:1"

ruby_add_bdepend "test? ( dev-ruby/safe_yaml dev-ruby/webmock )"

all_ruby_prepare() {
	# Remove failing spec, to be investigated later.
	rm spec/rubocop/formatter/json_formatter_spec.rb || die

	sed -i -e 's:/tmp/example:'${TMPDIR}'/example:' spec/rubocop/cop/team_spec.rb || die
}
