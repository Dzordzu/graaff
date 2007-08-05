# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rails/rails-1.2.3.ebuild,v 1.2 2007/03/14 14:49:26 rbrown Exp $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="ruby on rails is a web-application and persistance framework"
HOMEPAGE="http://www.rubyonrails.org"
SRC_URI="http://gems.rubyonrails.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="1.2"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86 ~x86-fbsd"

IUSE="mysql sqlite sqlite3 postgres fastcgi"
DEPEND=">=dev-lang/ruby-1.8.5
	app-admin/eselect-rails
	>=dev-ruby/rake-0.7.2
	=dev-ruby/activerecord-1.15.3
	=dev-ruby/actionmailer-1.3.3
	=dev-ruby/actionwebservice-1.2.3
	=dev-ruby/activesupport-1.4.2
	=dev-ruby/actionpack-1.13.3"

RDEPEND="${DEPEND}
	fastcgi? ( >=dev-ruby/ruby-fcgi-0.8.6 )
	sqlite? ( >=dev-ruby/sqlite-ruby-2.2.2 )
	sqlite3? ( dev-ruby/sqlite3-ruby )
	mysql? ( >=dev-ruby/mysql-ruby-2.7 )
	postgres? ( >=dev-ruby/ruby-postgres-0.7.1 )"

src_install() {
	gems_src_install
	# Rename slotted files that may clash so that eselect can handle
	# them
	mv ${D}/usr/bin/rails ${D}/usr/bin/rails-${PV}
	mv ${D}/${GEMSDIR}/bin/rails ${D}/${GEMSDIR}/bin/rails-${PV}
}

pkg_postinst() {
	eselect rails update --if-unset
}

pkg_postrm() {
	eselect rails update --if-unset
}
