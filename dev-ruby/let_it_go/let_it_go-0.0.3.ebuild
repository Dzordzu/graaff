# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="changelog.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Finds un-frozen string literals in your program"
HOMEPAGE="https://github.com/schneems/let_it_go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
