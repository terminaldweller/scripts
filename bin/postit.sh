#!/usr/bin/env sh

CLIP_HIST_FILE=/tmp/.clip_history
# POSTIT=$(cat ${CLIP_HIST_FILE} | dmenu -l 20 -p "Select Postit:")
sqlite3 $(cat /tmp/lclipd/lclipd_db_name) 'select content from lclipd;' | dmenu -l 20 | xsel -ib
# echo -n "${POSTIT:0:${#POSTIT}}" | xsel -ip
