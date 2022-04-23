#!/bin/sh

docker run -d -p 3306:3306 -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password mysql:8-debian
#docker run -it --network some-network --rm mysql mysql -hsome-mysql -uexample-user -p
