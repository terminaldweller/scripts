#!/usr/bin/env bash

# source common.sh
SEPARATOR_LEFT_BOLD=""
SEPARATOR_LEFT_THIN=""

RESULT=$(date +"%a %D %H:%M")
PROXY="proxychains4 -f /home/devi/proxies/ca/proxychains.conf"

DAY="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $1}')
DATE="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $2}')
TIME="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $3}')
UTC_TIME_RESULT=$(date -u +"%H:%M")
UTC_TIME="#[fg=colour255 bg=colour25]"$(echo GMT: $UTC_TIME_RESULT)
# JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
OPENWEATHERMAP_TOKEN=$(cat /home/devi/scripts/tmux/openweathermap.json|jq -r ".token")
# WEATHER_INFO=$(sleep 120 && torsocks curl "https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=$OPENWEATHERMAP_TOKEN&units=metric"|jq ".main.temp")
WEATHER_INFO=$(curl 'wttr.in/tehran?T&format=%t/%f')
WEATHER="#[fg=colour255 bg=colour32]"$(echo $WEATHER_INFO)

echo "#[fg=colour32 bg=colour16]$SEPARATOR_LEFT_BOLD$WEATHER#[fg=colour29 bg=colour32]$SEPARATOR_LEFT_BOLD$JDATE #[fg=colour31 bg=colour29]$SEPARATOR_LEFT_BOLD$DAY $SEPARATOR_LEFT_THIN $DATE $SEPARATOR_LEFT_THIN $TIME #[fg=colour25 bg=colour31]$SEPARATOR_LEFT_BOLD$UTC_TIME "
