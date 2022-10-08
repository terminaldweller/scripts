#!/usr/bin/env sh

docker run -d -e ALLOW_EMPTY_PASSWORD=yes -p 6379:6379 -it redis:6.2-alpine # pragma: allowlist secret
