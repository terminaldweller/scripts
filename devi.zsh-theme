# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

virtualenv_info() {
  # if [[ -a ./bin/activate ]]; then
  #   source ./bin/activate > /dev/null
  # fi
  # [ $VIRTUAL_ENV ] && echo ' ('`basename $VIRTUAL_ENV`')'
  if [[ $VIRTUAL_ENV != "" ]];then
    local result=$(basename $VIRTUAL_ENV)
    echo " ($result)"
  else
    ;
  fi
}
# add-zsh-hook chpwd virtualenv_info

PR_GIT_UPDATE=1

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
  turquoise="%F{81}"
  orange="%F{166}"
  purple="%F{135}"
  hotpink="%F{161}"
  limegreen="%F{118}"
  lorange="%F{222}"
  batyellow="%F{226}"
  muckgreen="%F{29}"
  batgreen="%F{76}"
  batred="%F{88}"
  tsocks="%F{132}"
  purblue="%F{69}"
  swampgreen="%F{64}"
  purple4="%F{54}"
  deeppink="%F{109}"
  someblue="%F{27}"
  bluesomething="%F{25}"
  limblue="%F{154}"
  skyblue="%F{30}"
  teal="%F{31}"
  new="%F{45}"
  new2="%F{50}"
  sneakyc="%F{63}"
  gnew="%F{65}"
  gnew2="%F{67}"
  gover="%F{111}"
  rust="%F{36}"
  typescript="%F{37}"
  viinsert="%F{33}"
  veryorange="%F{202}"
  yablue="%F{32}"
  yagreen="%F{34}"
  babyblue="%F{39}"
  somegreen="%F{22}"
  randomblue="%F{26}"
  yaorange="%F{67}"
else
  turquoise="$fg[cyan]"
  orange="$fg[yellow]"
  purple="$fg[magenta]"
  hotpink="$fg[red]"
  limegreen="$fg[green]"
  batyellow="%fg[yellow]"
  batgreen="%fg[green]"
  batred="%fg[red]"
fi

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH=" on %{$turquoise%}%s>%r>%b%u%c%a${PR_RST} "
FMT_ACTION=" performing a %{$limegreen%}%a${PR_RST}"
FMT_UNSTAGED="%{$orange%} ●"
FMT_STAGED="%{$limegreen%} ●"

zstyle ':vcs_info:*:prompt:*' unstagedstr "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats ""

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# steeef_preexec() {
#   case "$2" in
#     *git*)
#       PR_GIT_UPDATE=1
#       ;;
#     *svn*)
#       PR_GIT_UPDATE=1
#       ;;
#   esac
# }
# add-zsh-hook preexec steeef_preexec

# steeef_chpwd() {
#   local result=$(git rev-parse --is-bare-repository 2> /dev/null)
#   if [[ $? == 0 ]]; then
#     if [[ $result == true ]]; then
#       PR_GIT_UPDATE=
#     else
#       PR_GIT_UPDATE=1
#     fi
#   else
#     PR_GIT_UPDATE=1
#   fi
# }
# add-zsh-hook chpwd steeef_chpwd

# steeef_precmd() {
#   if [[ -n "$PR_GIT_UPDATE" ]] ; then
#     if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#       PR_GIT_UPDATE=1
#       FMT_BRANCH="${PM_RST} on %{$turquoise%}%s>%r>%b%u%c%a%{$hotpink%} ●${PR_RST}"
#     else
#       FMT_BRANCH="${PM_RST} on %{$turquoise%}%s>%r>%b%u%c%a${PR_RST} "
#     fi
#     zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH}"

#     vcs_info 'prompt'
#     PR_GIT_UPDATE=
#   fi
# }
# add-zsh-hook precmd steeef_precmd

# function guess_who {
#   upower -e > /dev/null 2>&1

#   if [ $? -eq 0 ]; then
#     os="lin"
#   else
#     os="win"
#   fi
# }
# add-zsh-hook precmd guess_who

tsocks_on() {
  if echo $LD_PRELOAD | grep libtsocks > /dev/null 2>&1; then
    # echo -ne "\x1b[38;5;0m\x1b[48;5;22m$reset_color\x1b[38;5;22m"
    echo "%K{22}%F{0}%K{0}%F{22}"
  else
    echo "$reset_color"
    ;
  fi
}

sudo_query() {
  if sudo -nv > /dev/null 2>&1; then
    echo "%K{33}%F{0}%K{0}%F{33}"
  else
    echo "$reset_color"
  fi
}


time_function() {
  date | gawk '{print $2" "$3" "$4}'
}

node_version() {
  local version=$(fnm current)
  echo " <$version>"
}

ruby_version() {
  local version=$(rbenv version | gawk '{print $1}')
  echo " <$version>"
}

dir_writeable() {
  if [ -w $(pwd) ]; then
    echo "$reset_color"
  else
    echo " %K{196}%F{0}%K{0}%F{196}"
  fi
}

sneaky() {
  if [[ $! -ne 0 ]]; then
    echo " $!"
  fi
}

bg_job_count() {
  # job_count=$("jobs" | wc -l)
  local job_count=$(echo $jobstates | awk 'END{print NF}')
  if [[ $job_count > 0 ]];then
    echo " $job_count"
  else
    ;
  fi
}

gitadditions() {
  # is_in_git_repo || return
  git rev-parse --git-dir > /dev/null 2>&1
  if [[ $? == 0 ]]; then
    local insertions=$(git --no-pager diff --numstat 2> /dev/null | awk '{sum1+=$1}END{print sum1}')
    if [[ $insertions == "" ]]; then
      ;
    else
      echo " "$insertions:
    fi
  fi
}

gitdeletions() {
  # is_in_git_repo || return
  git rev-parse --git-dir > /dev/null 2>&1
  if [[ $? == 0 ]]; then
    local deletions=$(git --no-pager diff --numstat 2> /dev/null | awk '{sum2+=$2}END{print sum2}')
    if [[ $deletions == "" ]]; then
      ;
    else
      echo $deletions
    fi
  fi
}

goversion() {
  local version=$("go" version | gawk '{print $3}')
  echo " <${version:2:$((${#version}))}>"
}

rustversion() {
  local version=$(rustc --version | gawk '{print $2}')
  echo " <$version>"
}

typescriptversion() {
  local version=$(tvm tsc --version | gawk '{print $2}')
  echo " <$version>"
}

pwd_shortened() {
  local cwd=$(pwd)
  IFS='/' read -rA tmux_path_array <<< "$cwd"
  typeset -i counter
  for i in "${tmux_path_array[@]}"
  do
    let counter++
    if [[ $counter == $(($#tmux_path_array)) ]]; then
      shortened_path+=$i
    else
      shortened_path+=${i:0:1}/
    fi
  done
  echo $shortened_path
}

zstyle ':zsh-kubectl-prompt:' separator ':'
getkubernetesinfo() {
  local SUB_PROMPT="%{$somegreen%}<<$ZSH_KUBECTL_USER:$ZSH_KUBECTL_PROMPT>>%{$reset_color%}"
  if [[ "$ZSH_KUBECTL_USER" =~ "admin" ]];then
    SUB_PROMPT="%{$someblue%}<$ZSH_KUBECTL_PROMPT>%{$reset_color%}"
  fi
  echo $SUB_PROMPT
}

getterminal() {
  if [ ! $TTY = "" ]; then echo $TTY;else echo $STY;fi
}

rbq_info_msg=""

PS1=$'$(dir_writeable)$(tsocks_on)$(sudo_query)%{$reset_color%} %{$yablue%}%n@%M:$(getterminal)%{$reset_color%} %{$yagreen%}$(pwd_shortened)%{$reset_color%} %{$muckgreen%}$(time_function)%{$reset_color%}$vcs_info_msg_0_%{$limblue%}%{$gnew%}$(gitadditions)%{$gnew2%}$(gitdeletions)%{$reset_color%}%{$deeppink%}$(virtualenv_info)%{$reset_color%}%{$teal%}$(node_version)%{$reset_color%}%{$gover%}$(goversion)%{$reset_color%}%{$rust%}$(rustversion)%{$reset_color%}%{$babyblue%}$(ruby_version)%{$reset_color%}%{$sneakyc%}$(sneaky)%{$reset_color%}%{$new%}$rbq_info_msg%{$reset_color%} $(getkubernetesinfo)%{$reset_color%}'
PS2=$''
PS3=$'\n%{$randomblue%}--➜%K{0}%F{15}'
get_prompt_len() {
  local zero='%([BSUbfksu]|([FK]|){*})'
  local FOOLENGTH=${#${(S%%)PS1//$~zero/}}
  echo $FOOLENGTH
}
get_prompt_len_2() {
  local zero='%([BSUbfksu]|([FK]|){*})'
  local FOOLENGTH=${#${(S%%)PS2//$~zero/}}
  echo $FOOLENGTH
}

get_enough_spaces(){
  ps1_len=$(get_prompt_len)
  ps2_len=$(get_prompt_len_2)
  term_len=$(tput cols)
  diff_len=$(($term_len - $ps1_len - $ps2_len))
  echo $diff_len
  for ((i=0;i<$diff_len;i++));do
    echo -n " "
    if [[ $i > $(tpul cols) ]];then break;fi
  done
}
# PROMPT="$PS1$(get_enough_spaces)$PS2$PS3"
PROMPT="$PS1$PS2$PS3"

# PROMPT="$PS1$PS3"

# function battery_charge {
#   upower -e > /dev/null 2>&1

#   if [ $? -eq 0 ]; then
#     batpath=$(upower -e | grep BAT0)
#     batcharge=$(upower -i $batpath | grep percentage | gawk '{print $2}')
#   else
#     batcharge=$(wmic path win32_battery get estimatedchargeremaining | gawk 'BEGIN{RS=" \n"}{print$3}')
#   fi

#   batfull=100
#   batgood=66
#   batbad=33

#   batcolor=$batgreen

#   if [[ ($batcharge > $batgood) || ($batcharge == $batgood) || ("$batcharge"=="$batfull") ]]; then
#     batcolor=$batgreen
#   elif [[ ($batcharge < $batgood) && ($batcharge > $batbad) || ($batcharge == $batbad) ]]; then
#     batcolor=$batyellow
#   elif [[ ($batcharge < $batbad) ]]; then
#     batcolor=$batred
#   else
#     batcolor=$purple
#   fi
# }
# add-zsh-hook precmd battery_charge

# function batcharge_printer {
#   $battery_charge
#   echo  $(if [ $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | gawk 'BEGIN{FS ~ ":"}{print $2}') = "charging" ]; then echo ++;else :;fi)$batcharge
# }

inranger() {
  local ranger_prompt=$(if [ -n "$RANGER_LEVEL" ];then echo " <ranger>";else echo "";fi)
  echo $ranger_prompt
}

timer_preexec() {
  typeset -g -F SECONDS
  timer=${timer:-$SECONDS}
}
add-zsh-hook preexec timer_preexec

timer_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    timer_show=$((timer_show*1000))
    typeset -g -i timer_show_int
    timer_show_int=$timer_show
    timer_final="$timer_show_int"mS
    unset timer
  fi
}
add-zsh-hook precmd timer_precmd

# async jobs
# https://github.com/vincentbernat/zshrc/blob/d66fd6b6ea5b3c899efb7f36141e3c8eb7ce348b/rc/vcs.zsh
_async_rbq_start() {
  async_start_worker rbq_info
  async_register_callback rbq_info _async_rbq_info_done
}

_async_rbq_info() {
  make -C $1 -q > /dev/null 2>&1
  if [[ $? == 1 ]]; then
    echo " ::rebuild::"
  else
    ;
  fi
}

_async_rbq_info_done() {
  local stdout=$3
  rbq_info_msg=$stdout
  zle reset-prompt
}

_async_vcs_start() {
  async_start_worker vcs_info
  async_register_callback vcs_info _async_vcs_info_done
}

_async_vcs_info() {
  cd -q $1
  vcs_info
  print ${vcs_info_msg_0}
}

_async_vcs_info_done() {
  local studout=$3
  vcs_info_msg_0=$stdout
  zle reset-prompt
}

# zsh-async https://github.com/mafredri/zsh-async
source /home/devi/zsh-async.git/v1.8.5/async.zsh
async_init
_async_rbq_start
_async_vcs_start

add-zsh-hook precmd() {
  async_job vcs_info _async_vcs_info $PWD > /dev/null 2>&1
}
ass-zsh-hook chpwd() {
  vcs_info_msg_0=
}

add-zsh-hook precmd() {
  async_job rbq_info _async_rbq_info $PWD > /dev/null 2>&1
}

add-zsh-hook chpwd() {
  rbq_info_msg=
}

#function vi-replacee {
#  RPS1="$VIM_PROMPT_REPLACE %{$lorange%}%?↵%{$reset_color%} %{$batcolor%}$(batcharge_printer)%%{$reset_color%}"
#  zle vi-replace
#}
#zle -N vi-replace-mode-widget vi-replacee
# bind R only in vicmd keymapping
#bindkey -M vicmd 'R' vi-replace-mode-widget

#https://raw.githubusercontent.com/alfredodeza/zsh-plugins/master/vi/zle_vi_visual.zsh
#this gives us vivis and vivli
source ~/.oh-my-zsh/plugins/zle-vi-visual/zle_vi_visual.zsh

function zle-line-init zle-keymap-select {
RIGHT_PROMPT="%{$teal%}$timer_final%{$reset_color%} \
%{$lorange%}%?↵%{$reset_color%}\
%{$yaorange%} L$SHLVL%{$reset_color%}\
%{$veryorange%}$(bg_job_count)%{$reset_color%}\
%{$bluesomething%}$(inranger)%{$reset_color%}"
# %{$purple4%}$(get_prompt_len)%{$reset_color%}"

  VIM_PROMPT_INSERT="%{$fg_bold[cyan]%}% [% INS]% %{$reset_color%}"
  VIM_PROMPT_MAIN="%{$fg_bold[blue]%}% [% INSERT]% %{$reset_color%}"
  VIM_PROMPT_REPLACE="%{$fg_bold[black]%}% %{$bg_bold[red]%}% [% REPLACE]% %{$reset_color%}"
  VIM_PROMPT_VISUAL_LINE="%{$fg_bold[red]%}% [% VISUAL-LINE]% %{$reset_color%}"
  VIM_PROMPT_VISUAL_CHAR="%{$fg_bold[red]%}% [% VISUAL]% %{$reset_color%}"
  VIM_PROMPT_CMD="%{$fg_bold[green]%}% [% NORMAL]% %{$reset_color%}"
  if [[ $KEYMAP == vivis ]]; then
    RPS1="$VIM_PROMPT_VISUAL_CHAR $RIGHT_PROMPT"
  elif [[ $KEYMAP == vivli ]]; then
    RPS1="$VIM_PROMPT_VISUAL_LINE $RIGHT_PROMPT"
  elif [[ $KEYMAP == vicmd ]];then
    RPS1="$VIM_PROMPT_CMD $RIGHT_PROMPT"
  elif [[ $KEYMAP == viins ]]; then
    RPS1="$VIM_PROMPT_INSERT $RIGHT_PROMPT"
  elif [[ $KEYMAP == main ]]; then
    RPS1="$VIM_PROMPT_MAIN $RIGHT_PROMPT"
    VI_MODE_R_ENTERED="no"
  fi
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
#bindkey "^[[3~" delete-char
#bindkey "^[3;5~" delete-char
export KEYTIMEOUT=1
