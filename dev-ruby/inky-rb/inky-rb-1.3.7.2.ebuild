# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A templating language that converts simple HTML into responsive email-ready HTML"
HOMEPAGE="https://github.com/zurb/inky-rb"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "
	dev-ruby/foundation_emails:2
	dev-ruby/nokogiri
"

all_ruby_prepare() {
	rm -f Gemfile.lock || die
	sed -i -e '/rubocop/I s:^:#:' -e '/bundler/I s:^:#:' Rakefile || die
}
