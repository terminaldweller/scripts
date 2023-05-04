#!/usr/bin/env sh

docker run \
  -e PUID=1000 \
  -e PGID=1000 \
  -v ./.sopel/:/home/sopel/.sopel/ \
  -e EXTRA_PYPI_PACKAGES="sopel-modules.weather sopel-modules.cryptocurrency sopel-modules.urban" \
  -ti \
  sopelirc/sopel
