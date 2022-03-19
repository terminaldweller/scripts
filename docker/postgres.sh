#!/usr/bin/env sh

docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=devi -e POSTGRES_USER=devi -e POSTGRES_DB=devi postgres:14.2-alpine3.15
# docker run --add-host=localhost:127.0.0.1 -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=devi -e POSTGRES_USER=devi -e POSTGRES_DB=devi postgres:13
