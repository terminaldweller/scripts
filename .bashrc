case $- in
*i*) ;;
*) return ;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set -o vi
export VAGRANT_DEFAULT_PROVIDER=libvirt
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_so=$'\e[1;92m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

alias la="ls -A"
alias ll="ls -la"
alias lss="ls -sSa"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ~="cd ~"
alias grep="grep --color=auto"
alias man="man -O width=210"
export LESS='--RAW-CONTROL-CHARS --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=2'
export PATH=$PATH:/usr/sbin

disk_usage=$(df | grep /dev/sdb3 | awk '{print $5}')

# https://www.askapache.com/linux/bash-power-prompt/
function aa_prompt_defaults() {
  local colors=$(tput colors 2>/dev/null || echo -n 1) C=

  if [[ $colors -ge 256 ]]; then
    C="$(tput setaf 33 2>/dev/null)"
    AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[38;5;2m"$((mf/1024))/"\033[38;5;89m"$((mt/1024))MB--$disk_usage; unset -v mf mt n a'
  else
    C="$(tput setaf 4 2>/dev/null)"
    AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[92m"$((mf/1024))/"\033[32m"$((mt/1024))MB--$disk_usage; unset -v mf mt n a'
  fi

  eval $AA_P

  PROMPT_COMMAND='stty echo; history -a; echo -en "\e[34h\e[?25h"; (($SECONDS % 2==0 )) && eval $AA_P; echo -en "$AA_PP";'
  SSH_TTY=${SSH_TTY:-$(tty 2>/dev/null || readlink /proc/$$/fd/0 2>/dev/null)}

  PS1="\[\e[m\n\e[1;38m\][\$\$:\$PPID \j:\!\[\e[1;38m\]]\[\e[0;36m\] \T \d \[\e[1;34m\][${C}\u@\H\[\e[1;34m\]:\[\e[0;37m\]${SSH_TTY/\/dev\//} \[\e[0;37m\]+${SHLVL}\[\e[1;34m\]] \[\e[1;37m\]\w\[\e[0;37m\]\n\\$ "

  export PS1 AA_P PROMPT_COMMAND SSH_TTY
}
aa_prompt_defaults
