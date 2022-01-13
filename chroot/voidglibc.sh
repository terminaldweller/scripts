#!/bin/sh

CHROOT_DIR=/home/devi/rootfs/voidglibc
sudo mount -t proc proc $CHROOT_DIR/proc/
sudo mount -t sysfs sys $CHROOT_DIR/sys/
# sudo mount -o bind /tmp $CHROOT_DIR/tmp/
# sudo mount -o bind /dev $CHROOT_DIR/dev/
sudo chroot $CHROOT_DIR
