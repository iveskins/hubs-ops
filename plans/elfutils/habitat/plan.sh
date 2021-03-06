pkg_name=elfutils
pkg_origin=mozillareality
pkg_version=0.175
pkg_license=('GPL-3.0')
pkg_maintainer="Mozilla Mixed Reality <mixreality@mozilla.com>"
pkg_description="elfutils is a collection of various binary tools such as
  eu-objdump, eu-readelf, and other utilities that allow you to inspect and
  manipulate ELF files."
pkg_upstream_url=https://sourceware.org/elfutils/
pkg_source=https://sourceware.org/${pkg_name}/ftp/${pkg_version}/$pkg_name-$pkg_version.tar.bz2
pkg_shasum=f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b
pkg_deps=(
  core/glibc
  mozillareality/zlib
  mozillareality/gcc-libs
)
pkg_build_deps=(
  core/gcc
  core/glibc
  core/m4
  core/make
  core/zlib
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  CFLAGS="${CFLAGS} -O2 -g" CPPFLAGS="${CPPFLAGS} -O2 -g" CXXFLAGS="${CXXFLAGS} -O2 -g" ./configure --prefix "${pkg_prefix}"
  make
}
