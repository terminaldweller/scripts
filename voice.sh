#!/usr/bin/bash
cd $(dirname $0)
"ogg123" $1 2> /dev/null
