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
  greeniegreen="%F{35}"
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

tsocks_on() {
  if echo $LD_PRELOAD | grep libtsocks > /dev/null 2>&1; then
    echo "%K{22}%F{0}%K{0}%F{22}"
  else
    echo ""
    ;
  fi
}

sudo_query() {
  if sudo -nv > /dev/null 2>&1; then
    echo "%K{33}%F{0}%K{0}%F{33}"
  else
    echo ""
  fi
}

time_function() {
  date +"%b-%d-%R:%S"
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
    echo ""
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

_async_gittrivia() {
  cd -q $1
  vcs_info
  print ${vcs_info_msg_0_}
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
  local SUB_PROMPT="%{$somegreen%}<<$ZSH_KUBECTL_USER:$ZSH_KUBECTL_PROMPT>>"
  if [[ "$ZSH_KUBECTL_USER" =~ "admin@" ]];then
    SUB_PROMPT="%{$someblue%}<$ZSH_KUBECTL_PROMPT>"
  fi
  echo $SUB_PROMPT
}

getterminal() {
  if [ ! $TTY = "" ]; then echo $TTY;else echo $STY;fi
}

rbq_info_msg=""
kube_info_msg=""

meson_env() {
  if [[ -n "${MESON_PROJECT_NAME-}" ]];then
    echo " [${MESON_PROJECT_NAME}]"
  else
    :
  fi
}

pyenv_version() {
  local version=$(pyenv version | awk '{print $1}')
  echo " <${version}>"
  # echo " <$CONDA_DEFAULT_ENV>"
}

NEWLINE=$'\n'
PS1='$(dir_writeable)\
$(tsocks_on)\
$(sudo_query) \
%{$yagreen%}$(pwd_shortened) \
%{$muckgreen%}$(time_function)\
%{$viinsert%}${vcs_info_msg_0_}\
%{$deeppink%}$(virtualenv_info)\
%{$greeniegreen%}$(meson_env)\
%{$yablue%}$(pyenv_version)\
%{$teal%}$(node_version)\
%{$gover%}$(goversion)\
%{$rust%}$(rustversion)\
%{$babyblue%}$(ruby_version)\
%{$sneakyc%}$(sneaky)\
%{$new%}$rbq_info_msg \
$(getkubernetesinfo)'
PS2=""
PS3="$NEWLINE%{$randomblue%}--➜%K{0}%F{15}"
PS4=""
PROMPT="$PS1$PS2$PS3"

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

rbq() {
  make -C $1 -q > /dev/null 2>&1
  if [[ $? == 1 ]]; then
    echo " ::rebuild::"
  else
    ;
  fi
}

# zsh-async https://github.com/mafredri/zsh-async
source /home/devi/zsh-async.git/v1.8.5/async.zsh

# async jobs
# https://github.com/vincentbernat/zshrc/blob/d66fd6b6ea5b3c899efb7f36141e3c8eb7ce348b/rc/vcs.zsh
_async_rbq_start() {
  async_start_worker rbq_info
  async_register_callback rbq_info _async_rbq_info_done
}

_async_rbq_info_done() {
  local job=$1
  local return_code=$2
  local stdout=$3
  local more=$6
  if [[  $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
        _async_rbq_start
      return
    fi
  fi
  rbq_info_msg=$stdout
  [[ $more == 1 ]] || zle reset-prompt
}

_async_gittrivia_start() {
  async_start_worker gittrivia_info
  async_register_callback gittrivia_info _async_gittrivia_done
}

_async_gittrivia_done() {
  local job=$1
  local return_code=$2
  local stdout=$3
  local more=$6
  if [[  $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      _async_gittrivia_start
      return
    fi
  fi
  vcs_info_msg_0_=$stdout
  [[ $more == 1 ]] || zle reset-prompt
}

async_init
_async_rbq_start
_async_gittrivia_start

add-zsh-hook precmd (){
  async_job rbq_info rbq $PWD
  async_job gittrivia_info _async_gittrivia $PWD
}

export PERIOD=3
add-zsh-hook periodic (){
}

add-zsh-hook chpwd (){
  rbq_info_msg=
  vcs_info_msg_0_=
}

#https://raw.githubusercontent.com/alfredodeza/zsh-plugins/master/vi/zle_vi_visual.zsh
#this gives us vivis and vivli
source ~/.oh-my-zsh/plugins/zle-vi-visual/zle_vi_visual.zsh

function zle-line-init zle-keymap-select {
RIGHT_PROMPT="%{$teal%}$timer_final \
%{$lorange%}%?↵\
%{$yaorange%} L$SHLVL\
%{$veryorange%}$(bg_job_count)\
%{$bluesomething%}$(inranger)"

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

export KEYTIMEOUT=1
