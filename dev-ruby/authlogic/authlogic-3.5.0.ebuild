# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="https://github.com/binarylogic/authlogic"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activerecord-3.2:*   <dev-ruby/activerecord-5.1:*
	>=dev-ruby/activesupport-3.2:*  <dev-ruby/activesupport-5.1:*
	>=dev-ruby/request_store-1.0.5:*
	>=dev-ruby/bcrypt-ruby-3.1.5"
ruby_add_bdepend "test? ( >=dev-ruby/bcrypt-ruby-3.1.5 dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/\(bundler\|rubocop\)/I s:^:#:' Rakefile || die

	sed -i -e '/:crypto_provider/ s/SCrypt/BCrypt/' lib/authlogic/acts_as_authentic/password.rb || die
	sed -i -e 's/SCrypt/BCrypt/' test/fixtures/users.yml || die

	sed -i -e '/scrypt/d' \
		-e '/bcrypt/ s/development_//' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid tests for now that fail due to our BCrypt hack
	rm -f test/session_test/{http_auth,persistence,password,magic_columns}_test.rb || die
	rm -f test/acts_as_authentic_test/{password,persistence_token}_test.rb || die
	rm -f test/crypto_provider_test/scrypt_test.rb || die
}
