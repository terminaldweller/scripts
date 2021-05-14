#!/usr/bin/bash

printf "%s\r\n" "W3m-control: GOTO $(xsel -ob)";
printf "W3m-control: DELETE_PREVBUF\r\n"
