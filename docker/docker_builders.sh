#!/bin/sh

SOCKS_4_PROXY="socks5://127.0.0.1:9995"
SOCKS_6_PROXY="socks5://[::1]:9993"
NO_PROXY="localhost,127.0.0.0/8,192.168.0.0/16,::1"
# create the builders
# --driver-opt env.no_proxy=${NO_PROXY} \
docker buildx create \
  --driver-opt env.http_proxy=${SOCKS_6_PROXY} \
  --driver-opt env.https_proxy=${SOCKS_6_PROXY} \
  --name proxy_builder_6

# --driver-opt env.no_proxy=${NO_PROXY} \
docker buildx create \
  --driver-opt env.http_proxy=${SOCKS_4_PROXY} \
  --driver-opt env.https_proxy=${SOCKS_4_PROXY} \
  --name proxy_builder_4

docker buildx create --name armbuilder

# choose one as default
docker buildx use proxy_builder_6
