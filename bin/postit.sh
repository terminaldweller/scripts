#!/usr/bin/env sh

POSTIT=$(cat ~/scripts/postit | dmenu -l 20 -p "Select Postit:")
echo -n "${POSTIT:0:${#POSTIT}}" | xsel -ip
