#!/usr/bin/env sh

docker run --detach -p 3306:3306 --env MARIADB_USER=devi --env MARIADB_PASSWORD=password --env MARIADB_ROOT_PASSWORD=password mariadb:10.9.4-jammy
