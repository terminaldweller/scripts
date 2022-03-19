#!/usr/bin/env zsh

export PATH=:$PATH:/home/devi/scripts/bin
export PATH=:$PATH:/home/devi/bin

alias speedtest="curl -o /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip"
alias quit="exit"
alias contest="ping 4.2.2.4 -c 7; ping google.com -c 7"
alias isup="ps -aux | grep "
alias diff="colordiff"
alias clean="clear"
alias mv="mv -i"
alias cp="cp -i"
alias vps="ssh 5.56.132.89 -l ubuntu"
alias v="vim"
alias getmangas="proxychains4 -q -f ~/proxies/ice/proxychains.conf kaminokumo --manga"
alias getanimes="proxychains4 -q -f ~/proxies/ice/proxychains.conf kaminokumo --anime"

function math {
  echo $(("$@"))
}

REPORTTIME=4
STARDICT_DATA_DIR="/home/bloodstalker/.stardict"
export STARDICT_DATA_DIR
alias def="sdcv --color"

export LESS='-R'
export LESSOPEN='|~/scripts/lesscolor.sh %s'

export EDITOR=vim
export BROWSER=lynx
