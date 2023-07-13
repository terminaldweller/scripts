#!/bin/sh

# source common.sh
SEPARATOR_LEFT_BOLD=""
SEPARATOR_LEFT_THIN=""
# PROXY="proxychains4 -q -f /home/devi/proxies/ice/proxychains.conf"

internet_time_cache() {
  INTERNET_TIME_CACHE_AGE=60
  INTERNET_TIME_CACHE_OUTPUT=/tmp/tmux_internet_time_cache
  # if the cache has not expired yet
  if [ $(( $( stat --format=%Y $INTERNET_TIME_CACHE_OUTPUT ) + INTERNET_TIME_CACHE_AGE )) -gt "$( date +%s )" ];then
    :
  else
    if OUTPUT=$(date -u +"%T" -d @$(curl -s --connect-timeout 10 --socks5-hostname localhost:9053 --user-agent "$(get_random_ua.sh)" http://worldtimeapi.org/api/timezone/Europe/London.json | jq '.unixtime')); then
      echo "${OUTPUT}" > ${INTERNET_TIME_CACHE_OUTPUT}
    fi
  fi
  cat ${INTERNET_TIME_CACHE_OUTPUT}
}

weather_info_cache() {
  WEATHER_INFO_CACHE_AGE=300
  WEATHER_INFO_CACHE_OUTPUT=/tmp/tmux_weather_info_cache
  if [ $(( $( stat --format=%Y $WEATHER_INFO_CACHE_OUTPUT ) + WEATHER_INFO_CACHE_AGE )) -gt "$( date +%s )" ];then
    :
  else
    if OUTPUT=$(curl -s --connect-timeout 10 --socks5-hostname socks5h://127.0.0.1:9053 'wttr.in/tehran?T&format=%f'); then
      echo "${OUTPUT}" > ${WEATHER_INFO_CACHE_OUTPUT}
    fi
  fi
  cat ${WEATHER_INFO_CACHE_OUTPUT}
}

ping_4() {
  ping -4 -c 1 -w 5 icanhazallips.terminaldweller.com >/dev/null 2>&1
}
ping_4_status() {
  if $(ping_4); then
    echo "#[fg=colour22 bg=colour25]#[fg=colour0 bg=colour22 bold]4"
  else
    echo "#[fg=colour1 bg=colour25]#[fg=colour0 bg=colour1 bold]4"
  fi
}

ping_6() {
  ping -6 -c 1 -w 5 icanhazallips.terminaldweller.com >/dev/null 2>&1
}
ping_6_status() {
  if $(ping_6); then
    echo "#[fg=colour22 bg=colour0]#[fg=colour0 bg=colour22 bold]6"
  else
    echo "#[fg=colour1 bg=colour0]#[fg=colour0 bg=colour1 bold]6"
  fi
}


RESULT=$(date +"%a %D %H:%M")

DAY="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $1}')
DATE="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $2}')
TIME="#[fg=colour255 bg=colour31]"$(echo "$RESULT" | gawk '{print $3}')
# INTERNET_TIME_RESULT=$(date -u +"%T" -d @$(curl -s --connect-timeout 10 --socks5-hostname localhost:9054 --user-agent "$(get_random_ua.sh)" http://worldtimeapi.org/api/timezone/Europe/London.json | jq '.unixtime'))
# UTC_TIME_RESULT=$(date -u +"%H:%M")
# UTC_TIME="#[fg=colour255 bg=colour25]"${INTERNET_TIME_RESULT}
UTC_TIME="#[fg=colour255 bg=colour25]"$(internet_time_cache)
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')

# OPENWEATHERMAP_TOKEN=$(jq -r ".token" < /home/devi/scripts/tmux/openweathermap.json)
# WEATHER_INFO=$(sleep 120 && proxychains4 -q -f /home/devi/proxies/ice/proxychains.conf curl "https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=${OPENWEATHERMAP_TOKEN}&units=metric"|jq ".main.temp")
# WEATHER_INFO=$(${PROXY} curl -s 'wttr.in/tehran?T&format=%f')
WEATHER_INFO=$(weather_info_cache)
if echo "${WEATHER_INFO}" | grep Unknown\ location; then
  WEATHER="#[fg=colour255 bg=colour32]"no_temp
else
  WEATHER="#[fg=colour255 bg=colour32]"${WEATHER_INFO}
fi

CPU_TEMP=$(sensors -j 2>/dev/null | jq .["\"coretemp-isa-0000\""]."\"Package id 0\"".temp1_input)
CPU_SECTION="#[fg=colour36 bg=colour24]${SEPARATOR_LEFT_BOLD}#[fg=colour16 bg=colour36]${CPU_TEMP}°C"
BATTERY=$(upower -i "$(upower -e | grep 'BAT')" | grep -E "percentage" | awk '{print $2}')

if ! headsetcontrol -b >/dev/null 2>&1; then
  HEADSET_BATTERY="not found"
else
  HEADSET_BATTERY=$(headsetcontrol -b | grep Battery | awk '{print $2}')
fi

echo "#[bg=colour0 fg=colour24]\
${SEPARATOR_LEFT_BOLD}#[fg=colour0 bg=colour24]${HEADSET_BATTERY}\
${CPU_SECTION}#[fg=colour32 bg=colour36]\
${SEPARATOR_LEFT_BOLD}${WEATHER}#[fg=colour29 bg=colour32]\
${SEPARATOR_LEFT_BOLD}${JDATE} #[fg=colour31 bg=colour29]\
${SEPARATOR_LEFT_BOLD}${DAY}#[fg=colour16]${SEPARATOR_LEFT_THIN}#[fg=colour255]${DATE}#[fg=colour16]${SEPARATOR_LEFT_THIN}#[fg=colour255]${TIME}#[fg=colour214 bg=colour31]\
${SEPARATOR_LEFT_BOLD}#[fg=colour0 bg=colour214]${BATTERY} #[fg=colour25 bg=colour214]\
${SEPARATOR_LEFT_BOLD}${UTC_TIME}\
$(ping_4_status)$(ping_6_status)"
