#!/bin/sh
set -e
set -x

. /bootstrap.sh
bootstrap
update_repos
crond -f -l 2
