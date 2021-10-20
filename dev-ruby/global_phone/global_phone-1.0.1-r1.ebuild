# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Parses, validates, and formats local and international phone numbers"
HOMEPAGE="https://github.com/sstephenson/global_phone"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
