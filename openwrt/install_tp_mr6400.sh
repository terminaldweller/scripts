#!/bin/sh

IF="enp0s20f0u3u1u3"
# mr6400 bootloader will want to get an image named tp_recovery.bin on 192.168.0.225/24. the bootloader's IP will be 192.168.0.2/24.
sudo ip addr add 192.168.0.225/24 dev ${IF}
sudo dnsmasq --port=0 --enable-tftp --tftp-root=/home/devi/devi/abbatoir/hole1 --tftp-no-blocksize --user=root --group=root -k --interface ${IF} -8 -
