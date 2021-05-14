export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-syntax-highlighting
  autojump
)
source $ZSH/oh-my-zsh.sh
function dig {
  globalholecounter=0
  if test "$(ls -A "~/abbatoir")"; then
    while [ 1 ]; do
      if [ -d "~/abbatoir/hole$globalholecounter" ]; then
        if test "$(ls -A "~/abbatoir/hole$globalholecounter")"; then
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

#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
