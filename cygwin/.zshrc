
COMPLETION_WAITING_DOTS="true"
plugins=(git svn zsh-syntax-highlighting autojump vi-mode)
export ZSH=~/.oh-my-zsh

if [[ -n "$INSIDE_EMACS" ]]; then
  ZSH_THEME="simple"
else
  ZSH_THEME="devi"
fi

COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-syntax-highlighting
  autojump
)
source $ZSH/oh-my-zsh.sh
function dig {
  globalholecounter=0
  if [ -d ~/abbatoir ]; then
    while [ 1 ]; do
      if [ -d ~/abbatoir/hole$globalholecounter ]; then
        if test "$(ls -A ~/abbatoir/hole$globalholecounter)"; then
          :
        else
          cd ~/abbatoir/hole$globalholecounter
          break
        fi
      else
        mkdir ~/abbatoir/hole$globalholecounter
        cd ~/abbatoir/hole$globalholecounter
        echo $globalholecounter
        break
      fi
      ((globalholecounter++))
    done
  else
    mkdir ~/abbatoir
    mkdir ~/abbatoir/hole$globalholecounter
    cd ~/abbatoir/hole$globalholecounter
  fi
}
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
alias quit="exit"
alias clean="clear"
alias la="ls -A"
alias digg="dig && clear"
alias lss="ls -s"
alias diff="colordiff"
function clearhalf {
  size=$(stty size|gawk '{print$1}')
  size=$(($size/2))
  tput cup $size 0 && tput ed
}
alias cleanhalf="clearhalf"
alias halfclear="clearhalf"
alias halfclean="clearhalf"
alias mv="mv -i"
alias cp="cp -i"
alias contest="ping 4.2.2.4 -c 7"
function math {
  echo $(($1))
}

alias ee="explorer ."
alias vi="vim"
alias lynx="lynx -lss ~/lynx.lss -prettysrc "
alias tmux="tmux -2"
function pdfsearch {
  tempfile=$(mktemp)
  for filename in  /cygdrive/d/mi-server/ETCS/ONBOARD.KERNEL/RM/STD/*.pdf; do
    echo $filename >> $tempfile
  done
  RGX=$1
  shift
  pdfgrep $RGX "$@" $(cat $tempfile)
}

REPORTTIME=4
export BROWSER=lynx
bindkey -v
export KEYTIMEOUT=1
export VIRTUAL_ENV_DISABLE_PROMPT=yes
export TERM=screen-256color
