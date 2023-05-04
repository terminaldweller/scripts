#!/usr/bin/env sh

SQL_DB="/dev/shm/lclipd"
content=$(sqlite3 "${SQL_DB}" "select replace(content,char(10),' '),id from lclipd;" | dmenu -fn "DejaVuSansMono Nerd Font Mono-11.3;antialias=true;autohint=true" -D "|" -l 20 -p "lclipd:")
sqlite3 "${SQL_DB}" "select content from lclipd where id = ${content}" | xsel -ib
