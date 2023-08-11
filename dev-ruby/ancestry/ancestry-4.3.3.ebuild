# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="ancestry.gemspec"

inherit ruby-fakegem

DESCRIPTION="Allows records to be organized in a tree structure"
HOMEPAGE="https://github.com/stefankroes/ancestry"
SRC_URI="https://github.com/stefankroes/ancestry/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

# Depends on appraisal which is not packaged yet
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/activerecord-5.2.6:*
"
