#!/bin/sh
set -e
set -x

. /bootstrap.sh
on_startup /etc/gitrepos/
crond -n -s -P
