#!/usr/bin/env sh

# get locations for initrd and kernel
# isoinfo -J -i ~/ssd1/images/kali-linux-2023.1-installer-purple-amd64.iso -f
virt-install \
  --connect qemu:///system \
  --name kali_purple \
  --vcpus=2 \
  --memory=4096 \
  --location /home/devi/ssd1/images/kali-linux-2023.1-installer-purple-amd64.iso,kernel=/install.amd/vmlinuz,initrd=/install.amd/initrd.gz \
  --disk pool=default,size=30,sparse=yes \
  --osinfo detect=on \
  --os-variant=debian11 \
  --graphics none \
  --console pty,target_type=serial
