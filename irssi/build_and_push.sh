#!/bin/sh

https_proxy=socks5://[::1]:9993 docker buildx build --platform linux/amd64 --push -t bloodstalker/irssi .
