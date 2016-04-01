# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

COMMIT=e4427917a3cccc04dd3633777a31e17b5133a743

DESCRIPTION="Compiler for the Pony language"
HOMEPAGE="http://www.ponylang.org/"
SRC_URI="https://github.com/CausalityLtd/ponyc/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="strip"

S="${WORKDIR}/ponyc-${COMMIT}"

RDEPEND="dev-libs/libpcre2
	dev-libs/openssl:=
	sys-devel/llvm:0/3.6
	sys-libs/ncurses:=
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	# bug #457530 means that '-ltinfo' might be needed besides '-lncurses' if a USE flag is enabled
	# for sys-libs/ncurses, so we use pkg-config to get the ncurses libs
	sed -i \
		-e 's/-Werror//' \
		-e 's/-O3//' \
		-e 's/LINKER_FLAGS =/LINKER_FLAGS = $(LDFLAGS)/' \
		-e 's/-march=$(arch)/$(CFLAGS)/' \
		-e 's#ln -sf $(destdir)#ln -sf ../lib/pony/$(tag)#' \
		-e "s#-lncurses#$(pkg-config ncurses --libs)#" \
		Makefile

	gcc_lib_dir="$(gcc-config -L | cut -d ':' -f 1)"
	sed -i \
		-e "s#/lib/x86_64-linux-gnu#${gcc_lib_dir}#" \
		src/libponyc/codegen/genexe.c

	# Avoid net/Broadcast test since it requires a working network
	# connection.
	sed -i -e '/test(_TestBroadcast)/d' packages/net/test.pony || die
}

common_make_args="config=release prefix=\"${D}usr\" verbose=yes"

src_compile() {
	emake ${common_make_args}
}

src_test() {
	emake ${common_make_args} test
}

src_install() {
	emake ${common_make_args} install
}
