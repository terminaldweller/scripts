#!/bin/sh

make_devices() {
  env mknod -m 0666 $1/dev/tty c 5 0
  chown root:tty $1/dev/tty
  for i in 0 1 2 3 4 5 6 7; do
    env mknod -m 0600 $1/dev/tty$i c 4 $i
    chown root:tty $1/dev/tty$i
    chmod 0620 $1/dev/tty$i
  done
  env mknod -m 0666 $1/dev/null c 1 3
  env mknod -m 0666 $1/dev/random c 1 8
  env mknod -m 0666 $1/dev/urandom c 1 9
  env mknod -m 0666 $1/dev/ptmx c 5 2
  chown root:tty $1/dev/ptmx
}
make_devices /home/devi/chroots/voidmusl
make_devices /home/devi/chroots/voidglibc
# debootstrap stable /home/devi/chroots/debian11 http://deb.debian.org/debian
