# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_EXTRAINSTALL="db"

inherit ruby-fakegem

DESCRIPTION="Advanced tagging for Rails."
HOMEPAGE="https://github.com/mbleigh/acts-as-taggable-on/"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

# Compatibility issues with rspec-rails and test-unit autorunner.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/rails-3 <dev-ruby/rails-5"

ruby_add_bdepend "test? ( dev-ruby/rspec:2 =dev-ruby/rspec-rails-2.13* >=dev-ruby/ammeter-0.1.3 dev-ruby/activerecord[sqlite3] )"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die

	# Provide a database.yml file for sqlite3.
	cp spec/database.yml.sample spec/database.yml || die
	sed -i -e '/^mysql/,$d' spec/database.yml || die
}
