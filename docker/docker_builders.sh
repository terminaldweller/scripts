#!/bin/sh

ALL_PROXY="socks5h://127.0.0.1:9995"
SOCKS_4_PROXY="socks5://127.0.0.1:9995"
SOCKS_6_PROXY="socks5://[::1]:9993"
NO_PROXY="127.0.0.0/8,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12"
# create the builders

# docker buildx create \
#   --driver-opt env.http_proxy=${SOCKS_4_PROXY} \
#   --driver-opt env.https_proxy=${SOCKS_4_PROXY} \
#   --driver-opt env.no_proxy=${NO_PROXY} \
#   --name proxy_builder

# --driver-opt env.http_proxy="${SOCKS_4_PROXY}" \
# --driver-opt env.https_proxy="${SOCKS_4_PROXY}" \
# --driver-opt env.no_proxy="${NO_PROXY}" \
docker buildx create \
  --driver-opt env.ALL_PROXY="${ALL_PROXY}" \
  --name proxy_builder_4

# docker buildx create --name armbuilder_proxy

# choose one as default
docker buildx use proxy_builder_4
