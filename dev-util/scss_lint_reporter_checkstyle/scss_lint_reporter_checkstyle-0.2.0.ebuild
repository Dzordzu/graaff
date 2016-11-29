# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A formatter to the scss-lint which is compatible with the Checkstyle standard"
HOMEPAGE="https://github.com/Sweetchuck/scss_lint_reporter_checkstyle"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
