#!/usr/bin/env sh

docker run --hostname gopher.terminaldweller.com -p 70:70 -v .:/var/gopher joshkaiju/gophernicus
