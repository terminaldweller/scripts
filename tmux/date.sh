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
UTC_TIME="#[fg=colour255 bg=colour25]"${UTC_TIME_RESULT}
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')

# OPENWEATHERMAP_TOKEN=$(jq -r ".token" < /home/devi/scripts/tmux/openweathermap.json)
# WEATHER_INFO=$(sleep 120 && proxychains4 -q -f /home/devi/proxies/ice/proxychains.conf curl "https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=${OPENWEATHERMAP_TOKEN}&units=metric"|jq ".main.temp")
WEATHER_INFO=$(proxychains4 -f ~/proxies/ice/proxychains.conf curl 'wttr.in/tehran?T&format=%f')
if echo "${WEATHER_INFO}" | grep Unknown\ location; then
  WEATHER="#[fg=colour255 bg=colour32]"no_temp
else
  WEATHER="#[fg=colour255 bg=colour32]"${WEATHER_INFO}
fi

date >> /tmp/time_counter

CPU_TEMP=$(sensors -j | jq .["\"coretemp-isa-0000\""]."\"Package id 0\"".temp1_input)
CPU_SECTION="#[fg=colour36 bg=colour24]${SEPARATOR_LEFT_BOLD}#[fg=colour16 bg=colour36]${CPU_TEMP} C"
BATTERY=$(upower -i "$(upower -e | grep 'BAT')" | grep -E "percentage" | awk '{print $2}')

if ! headsetcontrol -b ; then
  HEADSET_BATTERY="not found"
else
  HEADSET_BATTERY=$(headsetcontrol -b | grep Battery | awk '{print $2}')
fi

echo "#[bg=colour0 fg=colour24]\
${SEPARATOR_LEFT_BOLD}#[fg=colour0 bg=colour24]${HEADSET_BATTERY}\
${CPU_SECTION}#[fg=colour32 bg=colour36]\
${SEPARATOR_LEFT_BOLD}${WEATHER}#[fg=colour29 bg=colour32]\
${SEPARATOR_LEFT_BOLD}${JDATE} #[fg=colour31 bg=colour29]\
${SEPARATOR_LEFT_BOLD}${DAY} ${SEPARATOR_LEFT_THIN} ${DATE} ${SEPARATOR_LEFT_THIN} ${TIME} #[fg=colour214 bg=colour31]\
${SEPARATOR_LEFT_BOLD}#[fg=colour0 bg=colour214]${BATTERY} #[fg=colour25 bg=colour214]\
${SEPARATOR_LEFT_BOLD}${UTC_TIME} "
