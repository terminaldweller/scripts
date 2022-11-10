#!/bin/sh

https_proxy=socks5://127.0.0.1:9990 docker buildx build --platform linux/amd64 --push -t bloodstalker/irssi .
