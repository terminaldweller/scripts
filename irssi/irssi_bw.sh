#!/usr/bin/env sh

env -i \
  bwrap \
  --unshare-all --share-net \
  --ro-bind /usr/bin/irssi /usr/bin/irssi \
  --ro-bind /lib64/libgmodule-2.0.so.0.7400.0 /usr/lib64/libgmodule-2.0.so.0 \
  --ro-bind /lib/libglib-2.0.so.0 /usr/lib64/libglib-2.0.so.0 \
  --ro-bind /lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1 \
  --ro-bind /lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1 \
  --ro-bind /lib/libncursesw.so.6 /usr/lib64/libncursesw.so.6 \
  --ro-bind /lib/libpthread.so.0 /usr/lib64/libpthread.so.0 \
  --ro-bind /lib/libc.so.6 /usr/lib64/libc.so.6 \
  --ro-bind /lib/libdl.so.2 /usr/lib64/libdl.so.2 \
  --ro-bind /lib/libpcre2-8.so.0 /usr/lib64/libpcre2-8.so.0 \
  --ro-bind /usr/lib64/libncursesw.so /usr/lib64/libncursesw.so.6 \
  --ro-bind /usr/lib64/libncurses.so /usr/lib64/libncurses.so.6 \
  --ro-bind /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 \
  --ro-bind /usr/share/terminfo/s/st-256color /usr/share/terminfo/s/st-256color \
  --ro-bind /etc/resolv.conf /etc/resolv.conf \
  --uid 1000 \
  --gid 1000 \
  --setenv HTTP_PROXY socks5h://192.168.1.214 \
  --setenv HTTPS_PROXY socks5h://192.168.1.214 \
  --setenv NO_PROXY 10.0.0.0/8,localhost,127.0.0.1/8,192.168.0.0/16,172.16.0.0/12 \
  --setenv TERM st-256color \
  --seccomp 9 \
  irssi \
  9<"/tmp/seccomp_logging_filter.bpf"
