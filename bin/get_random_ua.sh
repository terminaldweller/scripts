#!/usr/bin/env sh

USER_AGENT_PATH=/home/devi/devi/List-of-user-agents
ANDY_FILE="Android+Webkit+Browser.txt"
OPERA_FILE="Opera.txt"
FFOX_FILE="Firefox.txt"
IE_FILE="Internet+Explorer.txt"
CHROME_FILE="Chrome.txt"
EDGE_FILE="Edge.txt"
SAFARI_FILE="Safari.txt"

get_ua() {
  if [ "$1" = "andy" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${ANDY_FILE}"
  elif [ "$1" = "opera" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${OPERA_FILE}"
  elif [ "$1" = "ffox" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${FFOX_FILE}"
  elif [ "$1" = "ie" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${IE_FILE}"
  elif [ "$1" = "chrome" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${CHROME_FILE}"
  elif [ "$1" = "edge" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${EDGE_FILE}"
  elif [ "$1" = "safari" ]; then
    UA_FILE="${USER_AGENT_PATH}"/"${SAFARI_FILE}"
  elif [ "$1" = "all" ]; then
    cat ${USER_AGENT_PATH}/${ANDY_FILE} \
      ${USER_AGENT_PATH}/${OPERA_FILE} \
      ${USER_AGENT_PATH}/${FFOX_FILE} \
      ${USER_AGENT_PATH}/${IE_FILE} \
      ${USER_AGENT_PATH}/${CHROME_FILE} \
      ${USER_AGENT_PATH}/${EDGE_FILE} \
      ${USER_AGENT_PATH}/${SAFARI_FILE} \
      > /tmp/random_uas_concat
    UA_FILE="/tmp/random_uas_concat"
  else
    echo "error: unknown kind. must be one of andy,opera,ffox,ie,chrome,edge,safari,all"
    exit 1
  fi

  shuf -n 1 "${UA_FILE}"
} 

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo "prints a random user agent string."
  echo "you can specify a --kind to get a random user agent of a specific browser."
  echo "currently the valid values are: andy,opera,ffox,ie,chrome,edge,safari,all"
elif [ "$1" = "--kind" ]; then
  get_ua "$2"
else
  get_ua all
fi
