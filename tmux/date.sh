#!/usr/bin/env bash

# source common.sh
SEPARATOR_LEFT_BOLD=""
SEPARATOR_LEFT_THIN=""

RESULT=$(date +"%a %D %H:%M")

DAY="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $1}')
DATE="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $2}')
TIME="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $3}')
UTC_TIME_RESULT=$(date -u +"%H:%M")
UTC_TIME="#[fg=colour255 bg=colour25]"$(echo GMT: $UTC_TIME_RESULT)
# JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
WEATHER_INFO=$(curl "https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=a2fab6f29fbe16083cf382306c2abee4&units=metric"|jq ".main.temp")
WEATHER="#[fg=colour255 bg=colour32]"$(echo $WEATHER_INFO" C")

echo "#[fg=colour32 bg=colour16]$SEPARATOR_LEFT_BOLD$WEATHER#[fg=colour29 bg=colour32]$SEPARATOR_LEFT_BOLD$JDATE #[fg=colour31 bg=colour29]$SEPARATOR_LEFT_BOLD$DAY $SEPARATOR_LEFT_THIN $DATE $SEPARATOR_LEFT_THIN $TIME #[fg=colour25 bg=colour31]$SEPARATOR_LEFT_BOLD$UTC_TIME "
