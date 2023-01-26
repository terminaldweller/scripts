#!/bin/sh

sshfs \
  -o compression=no \
  -o idmap=user \
  -o reconnect \
  ubuntu@10.167.131.24:/home/ubuntu \
  /home/devi/sshfs/lxc/ubuntu2204_python


sshfs \
  -o compression=no \
  -o idmap=user \
  -o reconnect \
  ubuntu@10.167.131.30:/home/ubuntu \
  /home/devi/sshfs/lxc/ubuntu2204_js
