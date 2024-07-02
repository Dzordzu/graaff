# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Support library for inflections"
HOMEPAGE="https://github.com/reactormonk/extlib/tree/inflection"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
