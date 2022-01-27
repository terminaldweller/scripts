#!/usr/bin/env bash
#./lemonbar.sh| lemonbar -f "DejaVuSansMono Nerd Font Mono-12" -g "x16"

NORMAL="%{F-}%{B-}"
sep_left=""
sep_right=""
sep_l_left=""
sep_l_right=""

DATETIME() {
  DATETIME=$(date "+%a %b %d, %T")
  echo -n " $DATETIME"
}

MEM_RAM() {
  RESULT=$(free -m | sed "1d"| gawk '{if (NR==1){print int($3/100)/10"G""/"int($2/100)/10"G"}}')
  echo -n " M:$RESULT"
}

MEM_SWAP() {
  RESULT=$(free -m | sed "1d"| gawk '{if (NR==2){print int($3/100)/10"G""/"int($2/100)/10"G"}}')
  echo -n " S:$RESULT"
}

HOME_FREE() {
  RESULT=$("df" | grep "/home$" | gawk '{print int($4/100000)/10"G"}')
  echo -n " HOME:$RESULT"
}

ROOT_FREE() {
  RESULT=$("df" | grep "/$" | gawk '{print int($4/100000)/10"G"}')
  echo -n " ROOT:$RESULT"
}

EXT1_FREE() {
  RESULT=$("df" | grep "/home/devi/storage/ext1$" | gawk '{print int($4/100000)/10"G"}')
  echo -n " EXT1:$RESULT"
}

DATETIME_SEGMENT="%{B#ff005f5f}%{F#ffcc6666}$sep_left%{B#ffcc6666}%{F#ffeeeeee}$(DATETIME)"
MEM_RAM_SEGMENT="%{B#ff0087ff}%{F#ff005f5f}$sep_left%{B#ff005f5f}%{F#ffeeeeee}$(MEM_RAM)"
MEM_SWAP_SEGMENT="%{B#ffff5f00}%{F#ff0087ff}$sep_left%{B#ff0087ff}%{F#ffeeeeee}$(MEM_SWAP)"
EXTRA_FREE_SEGMENT="%{B#ff875fd7}%{F#ffff5f00}$sep_left%{B#ffff5f00}%{F#ffeeeeee}$(EXT1_FREE)"
HOME_FREE_SEGMENT="%{B#ff5f00ff}%{F#ff875fd7}$sep_left%{B#ff875fd7}%{F#ffeeeeee}$(HOME_FREE)"
ROOT_FREE_SEGMENT="%{B#ff000000}%{F#ff5f00ff}$sep_left%{B#ff5f00ff}%{F#ffeeeeee}$(ROOT_FREE)"

while true; do
  echo -e "%{r} $ROOT_FREE_SEGMENT $HOME_FREE_SEGMENT $EXTRA_FREE_SEGMENT $MEM_SWAP_SEGMENT $MEM_RAM_SEGMENT $DATETIME_SEGMENT $NORMAL"
  sleep 60
done
