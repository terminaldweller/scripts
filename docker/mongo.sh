#!/usr/bin/env sh

docker run -p 27017:27017 -p 27018:27018 -p 27019:27019 -v mongo-data:/data/db mongo:4.4.4-bionic
