#!/usr/bin/env sh

PREFIX=$(surfraw -elvi | grep -v 'LOCAL\|GLOVAL'| fzf --algo=v2 -e | awk '{print $1}')
if [ "$PREFIX" = "" ]; then exit;fi
read -r -p " $PREFIX >>> Enter The Search Keyword: " INPUT
surfraw -p  "$PREFIX" "$INPUT" | xsel -p
