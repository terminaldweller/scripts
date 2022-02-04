#!/usr/bin/env sh

virsh pool-define-as --name default --type dir --target /home/devi/storage/ssd1/vagrant/libvirt
virsh pool-autostart default
virsh pool-start default
virsh pool-list
