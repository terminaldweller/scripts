#!/bin/sh

CHROOT_DIR=/home/devi/chroots/voidmusl
sudo mount -t proc proc $CHROOT_DIR/proc/
sudo mount -t sysfs sys $CHROOT_DIR/sys/
# sudo mount -o bind /tmp $CHROOT_DIR/tmp/
# sudo mount -o bind /dev $CHROOT_DIR/dev/
# rmdir $CHROOT_DIR/dev/pts
mkdir -p "$CHROOT_DIR/dev/pts"
sudo mount -t devpts none "$CHROOT_DIR/dev/pts" -o ptmxmode=0666,newinstance
# ln -fs /dev/pts/ptmx $CHROOT_DIR/dev/ptmx
sudo chroot $CHROOT_DIR
