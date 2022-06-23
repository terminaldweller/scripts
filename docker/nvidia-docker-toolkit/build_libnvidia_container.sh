#!/bin/sh

TOOLKIT_DIR=/home/devi/devi/nvidia-docker/container-toolkit/tools/container/toolkit
TOOLKIT=${TOOLKIT_DIR}/toolkit
torsocks make CFLAGS="-I/usr/include/tirpc -fPIC -O2" LDFLAGS=-ltirpc all
ln -s libnvidia-container.so.1.10.0 libnvidia-container.so.1
sudo cp libnvidia-container.so.1.10.0 /usr/lib64
sudo ${TOOLKIT} install /home/devi/nvidia-docker-toolkit
# nvidia-container-cli
