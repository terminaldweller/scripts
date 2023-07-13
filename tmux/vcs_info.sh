#!/bin/sh

# source common.sh
SEPARATOR_RIGHT_BOLD=""
# SEPARATOR_RIGHT_THIN=""

# MIN_MAJOR_VERSION="2"
# MIN_MINOR_VERSION="1"
# TMUX_VERSION="$(tmux -V)"

get_tmux_cwd() {
  tmux display -p -F "#{pane_current_path}"
}
tmux_path=$(get_tmux_cwd)
# cd "$tmux_path" && IFS='/' read -ra tmux_path_array <<<"$tmux_path"
# pos=$((${#tmux_path_array[*]} - 1))
# last=${tmux_path_array[$pos]}
# for i in "${tmux_path_array[@]}"; do
#   if [[ $i == "$last" ]]; then
#     shortened_path+=$i
#   else
#     shortened_path+=${i:0:1}/
#   fi
# done

gitadditions() {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    insertions=$(cd "${tmux_path}" && git --no-pager diff --numstat | awk '{sum1+=$1}END{print sum1}')
    echo +"$insertions"
  fi
}

gitdeletions() {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    deletions=$(cd "${tmux_path}" && git --no-pager diff --numstat | awk '{sum2+=$2}END{print sum2}')
    echo -"$deletions"
  fi
}

git_untracked_info() {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    untracked=$(cd "${tmux_path}" && git ls-files --others --exclude-standard | wc -w)
    echo ⋯"$untracked"
  fi
}

git_branch_info() {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(cd "${tmux_path}" && git rev-parse --abbrev-ref HEAD)
    echo " $branch"
  fi
}

repo_info() {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    insertions=$(cd "${tmux_path}" && git --no-pager diff --numstat | awk '{sum1+=$1}END{print sum1}')
    if cd "${tmux_path}" && git remote -v | grep github.com >/dev/null 2>&1; then
      echo  
    elif cd "${tmux_path}" && git remote -v | grep gitlab.com >/dev/null 2>&1; then
      echo  
    elif cd "${tmux_path}" && git remote -v | grep bitbucket.org >/dev/null 2>&1; then
      echo  
    else
      echo 
    fi
  else
    :
  fi
}

get_eth_price() {
  PRICE_TIME_CACHE=60
  PRICE_CACHE_OUTPUT_ETH=/tmp/tmux_PRICE_CACHE_ETH
  PRICE_CACHE_OUTPUT_XMR=/tmp/tmux_PRICE_CACHE_XMR
  # PRICE_CACHE_OUTPUT_CAKE=/tmp/tmux_PRICE_CACHE_CAKE
  # eth_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=ETH&unit=USD" | jq ".price")
  # cake_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=CAKE&unit=USD" | jq ".price")
  # monero_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=XMR&unit=USD" | jq ".price")
  if [ $(($(stat --format=%Y $PRICE_CACHE_OUTPUT_ETH) + PRICE_TIME_CACHE)) -gt "$(date +%s)" ]; then
    :
  else
    if ETH_OUTPUT=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=ETH&unit=USD" | jq ".price" | cut -d. -f1); then
      if [ -n "${ETH_OUTPUT}" ]; then
        echo "${ETH_OUTPUT}" >${PRICE_CACHE_OUTPUT_ETH}
      fi
    fi
  fi
  # if [ $(($(stat --format=%Y $PRICE_CACHE_OUTPUT_CAKE) + PRICE_TIME_CACHE)) -gt "$(date +%s)" ]; then
  #   :
  # else
  #   if CAKE_OUTPUT=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=CAKE&unit=USD" | jq ".price"); then
  #     if [ -n "${CAKE_OUTPUT}" ]; then
  #       echo "${CAKE_OUTPUT}" >${PRICE_CACHE_OUTPUT_CAKE}
  #     fi
  #   fi
  # fi
  if [ $(($(stat --format=%Y $PRICE_CACHE_OUTPUT_XMR) + PRICE_TIME_CACHE)) -gt "$(date +%s)" ]; then
    :
  else
    if XMR_OUTPUT=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=XMR&unit=USD" | jq ".price" | cut -d. -f1); then
      if [ -n "${XMR_OUTPUT}" ]; then
        echo "${XMR_OUTPUT}" >${PRICE_CACHE_OUTPUT_XMR}
      fi
    fi
  fi

  # result="$(cat ${PRICE_CACHE_OUTPUT_ETH})"/"$(cat ${PRICE_CACHE_OUTPUT_CAKE})"/"$(cat ${PRICE_CACHE_OUTPUT_XMR})"
  result="$(cat ${PRICE_CACHE_OUTPUT_ETH})"/"$(cat ${PRICE_CACHE_OUTPUT_XMR})"
  echo "${result}"
}

user_service_status() {
  if sv status ~/service/* | grep -v -E "^run:" >/dev/null 2>&1; then
    echo DOWN
  else
    echo UP
  fi
}

tmux_session_info=" #S:#I.#P:#D"
branch_info="#[fg=colour16]$(repo_info)#[fg=colour0 bg=colour39]"$(git_branch_info)
untracked_info="#[fg=colour255 bg=colour244]"$(git_untracked_info)
deletions_info="#[fg=colour255 bg=colour1]"$(gitdeletions)
additions_info="#[fg=colour255 bg=colour22]"$(gitadditions)
eth_price="#[fg=colour16 bg=colour37]"$(get_eth_price)
service_status_info="#[fg=colour16 bg=colour65, bold]"$(user_service_status)

echo "#[fg=colour255 bg=colour26]${tmux_session_info} #[fg=colour26 bg=colour39]$SEPARATOR_RIGHT_BOLD \
$branch_info #[fg=colour39 bg=colour22]$SEPARATOR_RIGHT_BOLD \
$additions_info #[fg=colour22 bg=colour1]$SEPARATOR_RIGHT_BOLD \
$deletions_info #[fg=colour1 bg=colour244]$SEPARATOR_RIGHT_BOLD \
$untracked_info #[fg=colour244 bg=colour37]$SEPARATOR_RIGHT_BOLD \
$eth_price #[fg=colour37 bg=colour65]$SEPARATOR_RIGHT_BOLD \
$service_status_info #[fg=colour65 bg=colour16]$SEPARATOR_RIGHT_BOLD"
