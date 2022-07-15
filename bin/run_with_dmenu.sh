#!/usr/bin/env zsh
. ~/scripts/zshrc_stripped.sh
COMMAND=$(echo "" | dmenu -fn "DejaVuSansMono Nerd Font Mono-11.3;antialias=true;autohint=true" -l 20 -p "Quick Term:")
RESULT=$(eval "$COMMAND")
if [ "$COMMAND" = "getmangas" ]; then
  echo "$RESULT" | sort | dmenu -fn "DejaVuSansMono Nerd Font Mono-11.3;antialias=true;autohint=true" -D ">" -l 20 -p "Quick Term Out:" | xsel -ib
else
  echo "$RESULT" | dmenu -fn "DejaVuSansMono Nerd Font Mono-11.3;antialias=true;autohint=true" -l 20 -p "Quick Term Out:" | xsel -ib
fi
