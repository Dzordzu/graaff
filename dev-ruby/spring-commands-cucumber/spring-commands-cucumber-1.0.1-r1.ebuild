# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="cucumber command for spring"
HOMEPAGE="https://github.com/jonleighton/spring-commands-cucumber"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/spring-0.9.1"
