#!/bin/sh
set -e

. /bootstrap.sh
on_startup
crond -s -P -f
