#!/usr/bin/env bash

# source common.sh
SEPARATOR_LEFT_BOLD=""
SEPARATOR_LEFT_THIN=""

RESULT=$(date +"%a %D %H:%M")
#PROXY="proxychains4 -f /home/devi/proxies/ca/proxychains.conf"

DAY="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $1}')
DATE="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $2}')
TIME="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $3}')
UTC_TIME_RESULT=$(date -u +"%H:%M")
UTC_TIME="#[fg=colour255 bg=colour25]"$UTC_TIME_RESULT
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
# OPENWEATHERMAP_TOKEN=$(cat /home/devi/scripts/tmux/openweathermap.json|jq -r ".token")
# WEATHER_INFO=$(sleep 120 && torsocks curl "https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=$OPENWEATHERMAP_TOKEN&units=metric"|jq ".main.temp")
WEATHER_INFO=$(curl 'wttr.in/tehran?T&format=%f')
echo "$WEATHER_INFO" | grep Unknown\ location;
if [ ! $? ]; then
  WEATHER="#[fg=colour255 bg=colour32]"err
else
  WEATHER="#[fg=colour255 bg=colour32]"$WEATHER_INFO
fi
CPU_TEMP=$(sensors -j | jq .["\"coretemp-isa-0000\""]."\"Package id 0\"".temp1_input)
CPU_SECTION="#[fg=colour36 bg=colour16]$SEPARATOR_LEFT_BOLD#[fg=colour16 bg=colour36]$CPU_TEMP C" 
BATTERY=$(upower -i "$(upower -e | grep 'BAT')" | grep -E "percentage" | awk '{print $2}')

echo "$CPU_SECTION#[fg=colour32 bg=colour36]\
$SEPARATOR_LEFT_BOLD$WEATHER#[fg=colour29 bg=colour32]\
$SEPARATOR_LEFT_BOLD$JDATE #[fg=colour31 bg=colour29]\
$SEPARATOR_LEFT_BOLD$DAY $SEPARATOR_LEFT_THIN $DATE $SEPARATOR_LEFT_THIN $TIME #[fg=colour214 bg=colour31]\
$SEPARATOR_LEFT_BOLD#[fg=colour0 bg=colour214]$BATTERY #[fg=colour25 bg=colour214]\
$SEPARATOR_LEFT_BOLD$UTC_TIME "
