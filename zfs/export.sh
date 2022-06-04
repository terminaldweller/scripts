#!/bin/sh

sudo umount -n /mnt/{dev/pts,dev,sys,proc}
sudo zpool export zroot
