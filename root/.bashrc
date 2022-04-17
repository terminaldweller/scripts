set -o vi
alias v="vim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias lss="ls -sS"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]@\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;12m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;170m\][\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;211m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;171m\]\\$\[$(tput sgr0)\] "

alias man="man -O width=210"
