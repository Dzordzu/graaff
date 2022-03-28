# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A PO file parser, editor and generator"
HOMEPAGE="https://github.com/arashm/poparser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/simple_po_parser-1.1.6 =dev-ruby/simple_po_parser-1.1*"

all_ruby_prepare() {
	sed -i -e '/SimpleCov/,/^end/ s:^:#: ; /\(awesome_print\|simplecov\)/ s:^:#: ; 1irequire "pathname"' spec/spec_helper.rb || die
}
