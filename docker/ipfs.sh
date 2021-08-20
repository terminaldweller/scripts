#!/usr/bin/env sh

IPFS_STAGING="/home/devi/.ipfs/staging";IPFS_DATA="/home/devi/.ippfs/data";docker run -d --name ipfs_host -v $IPFS_STAGING:/export -v $IPFS_DATA:/data/ipfs -p 4001:4001 -p 8881:8080 -p 5001:5001 ipfs/go-ipfs:latest
