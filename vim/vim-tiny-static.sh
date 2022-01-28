#!/usr/bin/env sh

make distclean

CFLAGS="" LD_FLAGS="-static" ./configure \
  --prefix=/debug/libs/runtime \
  --disable-channel \
  --disable-gpm \
  --disable-gtktest \
  --disable-gui \
  --disable-netbeans \
  --disable-nls \
  --disable-selinux \
  --disable-smack \
  --disable-sysmouse \
  --disable-xsmp \
  --enable-multibyte \
  --with-features=normal \
  --without-x

make -j4
