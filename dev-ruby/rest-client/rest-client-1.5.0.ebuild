# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

#RUBY_FAKEGEM_TASK_DOC="yard"
#RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="history.md README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="A simple HTTP and REST client for Ruby."
HOMEPAGE="http://github.com/archiloque/rest-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend dev-ruby/jeweler
ruby_add_bdepend test dev-ruby/webmock

ruby_add_rdepend ">=dev-ruby/mime-types-1.16"
