#!/usr/bin/sh

PID=$(pgrep hived$)
if [ -z "$PID" ]; then :;else echo hived;fi
