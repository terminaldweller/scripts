#!/usr/bin/env sh

/home/devi/gdb/gdb-9.2/configure \
  --enable-tui \
  --with-curses \
  --with-debuginfod \
  --with-expat \
  --with-lzma \
  --with-mpfr \
  --with-python=python3 \
  --with-guile \
  --with-isl \
  --with-mpc \
  --with-zlib \
  --enable-lto
