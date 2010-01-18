# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="IO::Buffer is a fast byte queue which is primarily intended for non-blocking I/O applications"
HOMEPAGE="http://mynyml.com/ruby/flexible-continuous-testing"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

each_ruby_prepare() {
	sed -i "s/lib\/iobuffer/ext\/iobuffer/" spec/buffer_spec.rb
}

each_ruby_configure() {
	cd ext
	${RUBY} extconf.rb || die "Failed to configure the extension."
}

each_ruby_compile() {
	cd ext
	emake || die "Failed to compile the extension."
}

each_ruby_test() {
	${RUBY} -Iext -S spec spec/buffer_spec.rb
}

each_ruby_install() {
	cd ext
	emake install DESTDIR="${D}" || die "Failed to install the extension."
}
