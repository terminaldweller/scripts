#!/bin/bash

function check_node_version() {
  MIN_VERSION="7.6.0"
  if [[ "$MIN_VERSION" == "$1" ]]; then return 0;fi
  local IFS=.
  VERSION="${1:1}"
  local i ver1=($MIN_VERSION) ver2=($VERSION) 
  for ((i=0; i < ${#ver1[@]}; i++)); do
    if [[ 10#${ver1[i]} > 10#${ver2[i]} ]]; then return 1;fi
    if [[ 10#${ver1[i]} < 10#${ver2[i]} ]]; then return 0;fi
  done
}

NODE_VERSION=$(node --version)
check_node_version $NODE_VERSION
if [[ $? == 1 ]]; then echo "node version is too old. please use v.7.6.0 or newer." && exit 1; fi
echo "node version is new enough!"
