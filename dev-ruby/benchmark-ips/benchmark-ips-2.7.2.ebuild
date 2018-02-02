# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

inherit ruby-fakegem

DESCRIPTION="A iterations per second enhancement to Benchmark"
HOMEPAGE="https://github.com/evanphx/benchmark-ips"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.6:5 )"

all_ruby_prepare() {
	sed -i -e '1i require "tempfile"' test/test_benchmark_ips.rb || die
}
