# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Hirb provides a view framework for console applications, designed to improve irb's default output."
HOMEPAGE="http://github.com/cldwalker/hirb/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Tests depend on context (available, not added yet) and matchy (not
# available as a gem). And now also on mocha-on-bacon.
RESTRICT="test"
