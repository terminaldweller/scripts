#!/bin/sh

# sudo mount -t ntfs3 /dev/sdc1 /home/devi/storage/ext2
# sudo mount -t ntfs3 /dev/sdd1 /home/devi/storage/ext1
# sudo mount -t ext4 /dev/sdb /home/devi/storage/ssd1 && sudo chown devi:devi /home/devi/storage/ssd1
sudo mount -t cifs -o user=pi4,vers=2.0,domain=MSHOME //192.168.1.200/disk1 /home/devi/sambashare
# sudo mount -t ntfs3 -U CC66518A66517664 /home/devi/storage/ext2
sudo mount -t ntfs3 -U 8A2CF4F62CF4DE5F /home/devi/storage/ext1
sudo mount -t ext4 -U a27a2530-a37e-4bb3-9f4b-4b3975253e43 /home/devi/storage/ssd1 && sudo chown devi:devi /home/devi/storage/ssd1
sudo mount -o bind /home/devi/storage/ssd1/nix/store /nix/store

sudo mkdir -p /tmp/tmpfs4_1
sudo mount -t tmpfs -o size=4000M tmpfs /tmp/tmpfs4_1
sudo chown devi:devi /tmp/tmpfs4_1
# virsh pool-define-as --name ramdisk --type dir --target /tmp/tmpfs4_1
# virsh pool-start ramdisk
