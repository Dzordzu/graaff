# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="stylesheets templates"

inherit ruby-fakegem

DESCRIPTION="Map helper functions for Sass 3.3 Maps including get-deep and set/set-deep"
HOMEPAGE="https://github.com/Snugug/Sassy-Maps"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/compass-1.0.0* >=dev-ruby/sass-3.3.0:3.3"
