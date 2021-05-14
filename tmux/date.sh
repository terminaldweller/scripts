#!/usr/bin/env bash

# source common.sh
SEPARATOR_LEFT_BOLD=""
SEPARATOR_LEFT_THIN=""

RESULT=$(date +"%a %D %H:%M")

DAY="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $1}')
DATE="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $2}')
TIME="#[fg=colour255 bg=colour31]"$(echo $RESULT | gawk '{print $3}')
UTC_TIME="#[fg=colour255 bg=colour75]"$(date -u +"%H:%I")
# JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')
JDATE="#[fg=colour255 bg=colour29]"$(jdate | gawk '{print $2" "$3}')

echo "#[fg=colour29 bg=colour16]$SEPARATOR_LEFT_BOLD$JDATE #[fg=colour31 bg=colour29]$SEPARATOR_LEFT_BOLD$DAY $SEPARATOR_LEFT_THIN $DATE $SEPARATOR_LEFT_THIN $TIME #[fg=colour75 bg=colour31]$SEPARATOR_LEFT_BOLD$UTC_TIME "
