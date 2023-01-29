#!/bin/sh

sudo zpool import -N -R /mnt zroot
sudo zfs load-key -L prompt zroot
sudo zfs mount zroot/ROOT/void
sudo zfs mount zroot/home
mount | grep mnt
sudo mount -t proc proc /mnt/proc
sudo mount -t sysfs sys /mnt/sys
sudo mount -B /dev /mnt/dev
# sudo mount -t devpts pts /mnt/dev/pts
sudo mount -t devpts none /mnt/dev/pts -o ptmxmode=0666,newinstance
sudo chroot /mnt /bin/bash
