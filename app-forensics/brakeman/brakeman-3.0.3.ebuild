# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES FEATURES README.md WARNING_TYPES"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC="brakeman.gemspec"

inherit ruby-fakegem

DESCRIPTION="a static analysis tool which checks Ruby on Rails applications for security vulnerabilities"
HOMEPAGE="http://brakemanscanner.org/"
SRC_URI="https://github.com/presidentbeef/brakeman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/erubis-2.6
	>=dev-ruby/haml-3.0:*  <dev-ruby/haml-5:*
	>=dev-ruby/highline-1.6.20 =dev-ruby/highline-1*
	>=dev-ruby/multi_json-1.2 =dev-ruby/multi_json-1*
	>=dev-ruby/ruby2ruby-2.1.1 =dev-ruby/ruby2ruby-2.1*
	>=dev-ruby/ruby_parser-3.6.2 =dev-ruby/ruby_parser-3*
	>=dev-ruby/sass-3.0:* =dev-ruby/sass-3*:*
	>=dev-ruby/slim-1.3.6 <dev-ruby/slim-3
	>=dev-ruby/terminal-table-1.4 =dev-ruby/terminal-table-1*"

all_ruby_prepare() {
	# Remove fastercsv since it's a no-op on ruby19.
	sed -i -e '/fastercsv/d' \
		-e '/ruby_parser/ s/3.6.2/3.6/' \
		-e '/highline/ s/1.6.20/1.6/' \
		${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} test/test.rb || die
}
