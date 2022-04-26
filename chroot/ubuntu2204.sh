#!/bin/sh

# sudo debootstrap jammy ./ubuntu2204 http://archive.ubuntu.com/ubuntu jammy
CHROOT_DIR=/home/devi/chroots/ubuntu2204
sudo mount -t proc proc $CHROOT_DIR/proc/
sudo mount -t sysfs sys $CHROOT_DIR/sys/
# sudo mount -o bind /tmp $CHROOT_DIR/tmp/
# sudo mount -o bind /dev $CHROOT_DIR/dev/
sudo mount -t devpts none "$CHROOT_DIR/dev/pts" -o ptmxmode=0666,newinstance
sudo chroot $CHROOT_DIR
