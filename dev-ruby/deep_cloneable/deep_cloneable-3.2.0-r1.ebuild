# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md readme.md"

RUBY_FAKEGEM_GEMSPEC="deep_cloneable.gemspec"

inherit ruby-fakegem

DESCRIPTION="Extends the functionality of ActiveRecord::Base#dup to perform a deep clone"
HOMEPAGE="https://github.com/moiristo/deep_cloneable"
SRC_URI="https://github.com/moiristo/deep_cloneable/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1:*"

ruby_add_bdepend "test? ( >=dev-ruby/activerecord-3.1:*[sqlite] )"

all_ruby_prepare() {
	sed -i -e '/\(appraisal\|bundler\)/ s:^:#:' Rakefile || die
}
