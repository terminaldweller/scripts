#!/usr/bin/env ksh

set -o vi
# set -o vi-tabcomplete
# bind ^I=complete-list 
HISTFILE="$HOME/.ksh_history"
HISTSIZE=5000

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias ls="ls --color=tty"
alias ll="ls -l"
alias la="ls -a"
alias lss="ls -sSA"
alias ~="cd ~"

alias quit="exit"
alias xx="dtrx"
alias mv="mv -i"
alias cp="cp -i"
alias df='df -h'
alias digg="dig && clear"
alias clean="clear"
alias quit="exit"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

function loginname {
  echo $USER
}

PS1='$(echo -ne "\033[32m`loginname`@`hostname`:\033[00m";if [[ "${PWD#$HOME}" != "$PWD" ]] then; echo -ne "\033[34m~${PWD#$HOME}\033[00m"; else; echo -ne "\033[34m$PWD\033[00m";fi;echo -ne " >>> ")'

function docpp {
  cp ~/scripts/makefilecpp ./makefile
  cp ~/scripts/c/main.cpp ./
  cp ~/scripts/c/header.hpp ./
  cp ~/scripts/.ycm_extra_config.py ./.ycm_extra_conf.py
  cp ~/scripts/cfam.vimrc ./.vimrc
  cp ~/scripts/compiler-explorer/ceconfig.json ./
  cp ~/scripts/c/debug.dbg ./
}

function docc {
  cp ~/scripts/makefilec ./makefile
  cp ~/scripts/c/main.c ./
  cp ~/scripts/.ycm_extra_config.py ./.ycm_extra_conf.py
  cp ~/scripts/cfam.vimrc ./.vimrc
  cp ~/scripts/compiler-explorer/ceconfig.json ./
  cp ~/scripts/c/debug.dbg ./
}

function dig {
  globalholecounter=0
  if test "$(ls -A "/home/devi/devi/abbatoir")"; then
    while [ 1 ]; do
      if [ -d "/home/devi/devi/abbatoir/hole$globalholecounter" ]; then
        # if its not empty
        if test "$(ls -A "/home/devi/devi/abbatoir/hole$globalholecounter")"; then
          :
        # if its empty
        else
          cd /home/devi/devi/abbatoir/hole$globalholecounter
          break
        fi
      else
        mkdir /home/devi/devi/abbatoir/hole$globalholecounter
        cd /home/devi/devi/abbatoir/hole$globalholecounter
        echo $globalholecounter
        break
      fi
      ((globalholecounter++))
    done
  else
    mkdir /home/devi/devi/abbatoir
    mkdir /home/devi/devi/abbatoir/hole$globalholecounter
    cd /home/devi/devi/abbatoir/hole$globalholecounter
  fi
}

function fd {
  ls -l $(find -iname "*$1*")
}

export SHELL="ksh"
export PATH=$PATH:/home/devi/scripts/bin
export PATH=$PATH:/home/devi/bin
export GOPROXY=https://goproxy.io
export HTTP_PROXY=socks5://127.0.0.1:9995
export HTTPS_PROXY=socks5://127.0.0.1:9995
export NO_PROXY=localhost,127.0.0.0/8,192.168.1.0/24,10.0.0.0/8,172.17.0.0/24
export http_proxy=socks5://127.0.0.1:9995
export https_proxy=socks5://127.0.0.1:9995
export no_proxy=localhost,127.0.0.0/8,192.168.1.0/24,10.0.0.0/8,172.17.0.0/24
