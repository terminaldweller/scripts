#!/usr/bin/env bash

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

function gitadditions {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    insertions=$(git --no-pager diff --numstat | awk '{sum1+=$1}END{print sum1}')
    echo +"$insertions"
  fi
}

function gitdeletions {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    deletions=$(git --no-pager diff --numstat | awk '{sum2+=$2}END{print sum2}')
    echo -"$deletions"
  fi
}

function git_untracked_info {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    untracked=$(git ls-files --others --exclude-standard | wc -w)
    echo ⋯"$untracked"
  fi
}

function git_branch_info {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    echo " $branch"
  fi
}

function repo_info {
  if cd "${tmux_path}" && git rev-parse --git-dir >/dev/null 2>&1; then
    insertions=$(git --no-pager diff --numstat | awk '{sum1+=$1}END{print sum1}')
    if git remote -v | grep github >/dev/null 2>&1; then
      echo  
    else
      echo 
    fi
  else
    :
  fi
}

function get_eth_price {
  eth_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=ETH&unit=USD" | jq ".price")
  cake_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=CAKE&unit=USD" | jq ".price")
  monero_price=$(proxychains4 -q -f ~/proxies/ice/proxychains.conf curl -s -X GET "https://api.terminaldweller.com/crypto/v1/price?name=XMR&unit=USD" | jq ".price")
  echo "${eth_price}/${cake_price}/${monero_price}"
}

tmux_session_info=" #S:#I.#P"
branch_info="#[fg=colour16]$(repo_info)#[fg=colour0 bg=colour39]"$(git_branch_info)
untracked_info="#[fg=colour255 bg=colour244]"$(git_untracked_info)
deletions_info="#[fg=colour255 bg=colour1]"$(gitdeletions)
additions_info="#[fg=colour255 bg=colour22]"$(gitadditions)
eth_price="#[fg=colour16 bg=colour37]"$(get_eth_price)

echo "#[fg=colour255 bg=colour26]$tmux_session_info #[fg=colour26 bg=colour39]$SEPARATOR_RIGHT_BOLD \
$branch_info #[fg=colour39 bg=colour22]$SEPARATOR_RIGHT_BOLD \
$additions_info #[fg=colour22 bg=colour1]$SEPARATOR_RIGHT_BOLD \
$deletions_info #[fg=colour1 bg=colour244]$SEPARATOR_RIGHT_BOLD \
$untracked_info #[fg=colour244 bg=colour37]$SEPARATOR_RIGHT_BOLD \
$eth_price #[fg=colour37 bg=colour16]$SEPARATOR_RIGHT_BOLD"
