#!/usr/bin/env zsh

. ~/scripts/zshrc_stripped.sh
COMMAND=$(echo "" | dmenu -i -l 20 -p "Quick Term:")
RESULT=$(eval "$COMMAND")
echo $RESULT | dmenu -i -l 20 -p "Quick Term Out:" | xsel -ib
