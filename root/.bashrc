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

export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]@\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;12m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;170m\][\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;211m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;171m\]\\$\[$(tput sgr0)\] "
