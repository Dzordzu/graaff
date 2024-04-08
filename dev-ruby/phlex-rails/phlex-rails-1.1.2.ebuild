# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="phlex-rails.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A high-performance view framework optimised for developer happiness"
HOMEPAGE="https://github.com/phlex-ruby/phlex-rails"
SRC_URI="https://github.com/phlex-ruby/phlex-rails/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

# Currently requires a git checkout of appraisal.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/phlex-1.9.1:1 =dev-ruby/phlex-1.9*
	|| ( dev-ruby/railties:7.1 dev-ruby/railties:7.0 dev-ruby/railties:6.1 )
	>=dev-ruby/zeitwerk-2.6:2
"

ruby_add_bdepend "test? (
	dev-ruby/rspec-rails
)"

all_ruby_prepare() {
	sed -e 's:_relative ": "./:' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
