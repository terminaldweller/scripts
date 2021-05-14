#!/usr/bin/env sh

TAB_RESTORE_LIMIT=30

last_tab=$(tail -n 1 ~/.w3m/RestoreTab.txt);
limit=$(tail -n $TAB_RESTORE_LIMIT ~/.w3m/RestoreTab.txt)
other_tabs=$(printf "%s" "$limit" | head -n -1);
printf "%s\r\n" "$other_tabs" > ~/.w3m/RestoreTab.txt;
printf "%s\r\n" "W3m-control: GOTO $last_tab";
printf "W3m-control: DELETE PREVBUF\r\n";
