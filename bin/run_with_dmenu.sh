#!/usr/bin/env zsh

# set -o pipefail
source ~/scripts/zshrc_stripped.sh
COMMAND=$(echo "" | dmenu -h 20 -p "Quick Term:")
RESULT=$(eval "$COMMAND")
echo $RESULT | dmenu -h 20 -p "Quick Term Out:" > /dev/null
