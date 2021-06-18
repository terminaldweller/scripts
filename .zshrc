# Path to your oh-my-zsh installation.
  export ZSH=/home/devi/.oh-my-zsh

ZSH_THEME="devi"

COMPLETION_WAITING_DOTS="true"

plugins=(git svn zsh-syntax-highlighting autojump virtualenv virtualenvwrapper cargo nvm npm docker rustup zsh-autosuggestions zsh-kubectl-prompt kubectl docker-compose vagrant)

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/devi/.local/bin:/home/devi/bin"

source $ZSH/oh-my-zsh.sh

[[ -s /home/devi/.autojump/etc/profile.d/autojump.sh ]] && source /home/devi/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

alias ls="exa"
alias la="exa -a"
alias ll="exa -abghHliSmxGF --git -@"
alias lss="exa -S"
alias ee="nautilus ."
alias updaterc="cp ~/scripts/.zshrc ~/.zshrc"
alias fixvimrc='cp ~/scripts/.vimrc ~/.vimrc'
alias fixtmuxrc='cp ~/scripts/.tmux.conf ~/.tmux.conf'
alias fixtmuxpowerline='cp ~/scripts/default.sh ~/tmux-powerline/themes/default.sh'
alias fixctagsrc='cp ~/scripts/.ctags ~/.ctags'
alias fixtvrc='cp ~/scripts/.tvrc ~/.tvrc'
alias tmuxpowerline='vim ~/scripts/default.sh'
alias speedtest="curl -o /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip"
alias zshrc="vim ~/scripts/.zshrc"
alias vimrc="vim ~/scripts/.vimrc"
alias tmuxrc="vim ~/scripts/.tmux.conf"
alias zshtheme="vim ~/scripts/devi.zsh-theme"
alias quit="exit"
alias xx="dtrx"
alias angband="/home/devi/angband-4.1.0/angband-master/src/angband"
alias startdocker="sudo systemctl start docker"
alias vv="vim"
alias mm="cmatrix -s -C blue"
alias contest="ping 4.2.2.4 -c 7; ping google.com -c 7"
alias solide="vim ~/scripts/makefile"
alias dropsolide="cp ~/scripts/makefile ./"
alias genjctags="find . -type f -iregex \".*\.js$\" -not -path \"./node_modules/*\" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags"
alias isup="ps -aux | grep "
alias ipfsd="ipfs daemon > /dev/null 2>&1 &; disown"
alias i3rc="vim ~/scripts/.config/i3/config"
alias fixi3rc="cp ~/scripts/.config/i3/config ~/.config/i3/config && i3-msg restart"
alias muttrc="vim ~/scripts/.muttrc"
alias fixmuttrc="cp ~/scripts/.muttrc ~/.muttrc"
alias dropcmake="cp ~/scripts/makefilec ./makefile"
alias dropcppmake="cp ~/scripts/makefilecpp ./makefile"
alias droppy="cp ~/scripts/python/main.py ./main.py"
alias diff="colordiff"
alias yy="~/scripts/hived"
alias newsboaturls="vim ~/scripts/.newsboat/urls"
alias fixnewsboaturls="cp ~/scripts/.newsboat/urls ~/.newsboat/urls"
alias newsboatconfig="vim ~/scripts/.newsboat/config"
alias fixnewsboatconfig="cp ~/scripts/.newsboat/config ~/.newsboat/config"
alias qtrc="vim ~/scripts/qtbrowser/config.py"
alias fixqtrc="cp ~/scripts/qtbrowser/config.py ~/.config/qutebrowser/config.py"
alias dropcextra="cp ~/scripts/c/devi_extra.h ./devi_extra.h"
alias dropcmain="cp ~/scripts/c/main.c ./"
alias dropcppmain="cp ~/scripts/c/main.cpp ./"
alias telebot="/home/devi/scripts/telebot.py > /dev/null 2>&1 &"
alias dw="~/df/df_linux/df"
alias clean="clear"
alias lynx="lynx -lss ~/scripts/lynx.lss -cfg ~/scripts/lynx.cfg -prettysrc"
alias hplovecraft="lynx http://www.hplovecraft.com/writings/texts/"
alias casmith="lynx http://www.eldritchdark.com/writings/short-stories/"
alias tt="transmission-cli -u 1 -w ~/winshare/"
alias w3m="torsocks w3m -graph"
#alias make="colormake"
#alias gcc="COLORMAKE_COMMAND=gcc colormake"
#alias clang="COLORMAKE_COMMAND=clang colormake"
alias mv="mv -i"
alias cp="cp -i"
alias nuke="rm -rf * .[!.]* ..?*"
alias bruiser="bruiser --history ~/.bruiser/history.lua"
alias digg="dig && clear"
alias ogg="ogg123"
alias jupyterlocal="jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8775"
alias mupdf="/home/devi/extra/mupdf/build/release/mupdf-x11 -D red -P black -I"
alias googler="~/extra/googler/googler --colors GKmexy -c us -l en --count 7 --exact "
alias ddgr="ddgr --colorize always -r us-en -n 15"
alias pirate-get="pirate-get -S ~/magnets/"
alias vps="ssh 87.236.209.206 -l ubuntu"
alias vpn="ssh 192.99.102.52 -l rooot -p 1022"
alias pytags="ctags --fields=+l --languages=python --python-kinds=-iv -R ."
alias v="vim"
alias kshrc="vim ~/scripts/.kshrc"
alias fixkshrc="cp ~/scripts/.kshrc ~/.kshrc"
alias rangerrc="vim ~/scripts/.config/ranger/rc.conf"
alias fixrangerrc="cp ~/scripts/.config/ranger/rc.conf ~/.config/ranger/rc.conf"
alias zathurarc="vim ~/scripts/zathurarc"
alias fixzathurarc="cp ~/scripts/zathurarc ~/.config/zathura/"
alias lynxcfg="cp ~/scripts/lynx.cfg"
alias lynxlss="cp ~/scripts/lynx.lss"
alias w3mkeymap="vim ~/scripts/.w3m/keymap"
alias w3mconfig="vim ~/scripts/.w3m/config"
alias fixw3mkeymap="cp ~/scripts/.w3m/keymap ~/.w3m/"
alias fixw3mconfig="cp ~/scripts/.w3m/config ~/.w3m/"
alias tsc='tvm tsc'
alias batrc="vim ~/scripts/.config/bat/config"
alias fixbatrc="cp ~/scripts/.config/bat/config ~/.config/bat/config"
alias psqlrc="vim ~/scripts/.psqlrc"
alias fixpsqlrc="cp ~/scripts/.psqlrc ~/.psqlrc"
alias pgclirc="vim ~/scripts/.config/pgcli/config"
alias fixpgclirc="cp ~/scripts/.config/pgcli/config ~/.config/pgcli/config"
alias jupyter="~/.local/bin/jupyter-notebook --no-browser"
alias iredisrc="vim ~/scripts/.iredisrc"
alias fixiredisrc="cp ~/scripts/.iredisrc ~/.iredisrc"
alias irssi="irssi -n terminaldweller"
alias joplinkeymap="vim ~/scripts/.config/joplin/keymap.json"
alias fixjoplinkeymap="cp ~/scripts/.config/joplin/keymap.json ~/.config/joplin/keymap.json"
alias mpv="/mnt/c/ProgramData/chocolatey/lib/mpv.install/tools/mpv.exe"
alias postitrc="vim ~/scripts/postit"
alias rainbowrc="vim ~/scripts/.rainbow_config.json"
alias fixrainbowrc="cp ~/scripts/.rainbow_config.json ~/.rainbow_config.json"
alias irssiconfig="vim ~/scripts/irssi/config"
alias irssitheme="vim ~/scripts/irssi/solarized-powerline.theme"
alias irssistartup="vim ~/scripts/irssi/startup"
alias fixirssiconfig="cp ~/scripts/irssi/config ~/.irssi/config"
alias fixirssitheme="cp ~/scripts/irssi/solarized-powerline.theme ~/.irssi/solarized-powerline.theme"
alias fixirssistartup="cp ~/scripts/irssi/startup ~/.irssi/startup"
alias w3mlastsession="~/.w3m/bin/w3mlastsession"
alias lsdrc="vim ~/scripts/.config/lsd/config.yaml"
alias fixlsdrc="cp ~/scripts/.config/lsd/config.yaml ~/.config/lsd/config.yaml"
alias vagrant="PATH=$PATH:/mnt/c/Windows/System32:/mnt/c/Windows/System32/WindowsPowerShell/v1.0 vagrant"
alias cygwin="/mnt/d/home/apps/cygwin/bin/bash.exe -l -i"
alias farmanager="/mnt/c/Program\ Files/Far\ Manager/Far.exe"
alias pwsh="/mnt/c/Program\ Files/PowerShell/7/pwsh.exe"
alias wincmd="/mnt/c/Windows/System32/runas.exe /profile /user:administrator cmd.exe"
alias vms="ssh 185.126.202.69 -l ubuntu -p 1022"
alias xonshrc="vim ~/scripts/.xonshrc"
alias fixxonshrc="cp ~/scripts/.xonshrc ~/.xonshrc"
alias sshphone="ssh 192.168.1.110 -l u0_a263 -p 8022"
alias moshvpn="mosh rooot@192.99.102.52 --ssh='ssh -p 1022'"
alias moshvps="mosh ubuntu@terminaldweller.com --ssh='ssh -p 1022'"
alias proxychainsrc="vim ~/scripts/.proxychains/proxychains.conf"
alias fixproxychainsrc="cp ~/scripts/.proxychains/proxychains.conf ~/.proxychains/proxychains.conf"
alias zgit="proxychains git"
alias socks5z="ssh -N -D 9998 -o ExitOnForwardFailure=yes -l pi 192.168.1.108"

#autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5fff,bg=#000000,bold"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

function lemon {
  /home/devi/scripts/lemonbar.sh | lemonbar -f "DejaVu Sans Mono for Powerline:size=11" -g "x16"
}

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

function mdvv {
  mdv -t 729.8953 "$@"
}

function gdd {
  #git --no-pager diff --numstat | gawk \'{print$1$2}\'
  git --no-pager diff --numstat | gawk '{sum1+=$1;sum2+=$2}END{print "additions:"sum1"  ""deletions:"sum2}'
}

function math {
  echo $(($@))
}

function pid {
  ps -aux | grep "$1" | grep -v grep | awk '{print$2}'
}

#bicon_on=$(ps -aux | grep bicon | grep -v grep | awk '{print$2}')
#if [[ -z "${bicon_on// }" ]]; then
#  /usr/bin/bicon.bin
#fi

REPORTTIME=4
STARDICT_DATA_DIR="/home/devi/.stardict"
export STARDICT_DATA_DIR
export DISPLAY="192.168.1.103:0"
export LIBGL_ALWAYS_INDIRECT=1
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export WWW_HOME="duckduckgo.com"
alias def="sdcv --color"
#goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

export LESS='--RAW-CONTROL-CHARS --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=2'
export LESSOPEN='|~/scripts/lesscolor.sh %s'
export PYGMENTIZE_STYLE="paraiso-dark"
# libtrash settings
# export LD_PRELOAD=/usr/local/lib/libtrash.so.3.5
# alias trashon=”export TRASH_OFF=NO”
# alias trashoff=”export TRASH_OFF=YES”

export BAT_THEME="Solarized (light)"

export FZF_TMUX_OPTS="-p 70%,70%"
export FZF_DEFAULT_OPTS="--color fg:7,bg:0,hl:31,fg+:24,bg+:0,hl+:63,info:34,prompt:27,spinner:24,pointer:24,marker:22"

export YTFZF_HIST=1
export YTFZF_LOOP=0
# export YTFZF_PREF="bestvideo[height<=?1080]+bestaudio/best"
export YTFZF_PREF="22"
export YTFZF_ENABLE_FZF_DEFAULT_OPTS=1
export YTFZF_CACHE=~/.cache/ytfzf

function fixrc {
  cp ~/scripts/.zshrc ~/.zshrc
  source ~/.zshrc
}

function fixtheme {
  cp ~/scripts/devi.zsh-theme ~/.oh-my-zsh/themes/devi.zsh-theme
  source ~/.zshrc
}

export PATH=$PATH:/home/devi/.cargo/bin
export PATH=$PATH:/home/devi/scripts/bin
export PATH=$PATH:/home/devi/.fzf/bin
export PATH=$PATH:/home/devi/.ghcup/bin
export PATH=$PATH:/home/devi/k3s
export PATH=$PATH:/home/devi/kompose
export PATH=$PATH:/home/devi/mongosh
export PATH=$PATH:/home/devi/powershell
export PATH=$PATH:/home/devi/protobuf/bin
export PATH=$PATH:/home/devi/ytfzf
export PATH=$PATH:/home/devi/gotty
export PATH=$PATH:/home/devi/.poetry/bin

export EDITOR=vim
export BROWSER=w3m

function dig {
  globalholecounter=0
  if test "$("ls" -A "/home/devi/devi/abbatoir")"; then
    while [ 1 ]; do
      if [ -d "/home/devi/devi/abbatoir/hole$globalholecounter" ]; then
        # if its not empty
        if test "$("ls" -A "/home/devi/devi/abbatoir/hole$globalholecounter")"; then
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

function clearhalf {
  clear
  size=$(stty size|gawk '{print$1}')
  size=$(($size/2))
  tput cup $size 0 && tput ed
}
alias cleanhalf="clearhalf"
alias halfclear="clearhalf"
alias halfclean="clearhalf"
alias dighalf="dig && cleanhalf"

function nn {
  echo $1 >> ~/.devi/notes.txt
}

function nnshow {
  cat ~/.devi/notes.txt
}

function nnedit {
  vim ~/.devi/notes.txt
}

function nnpurge {
  rm ~/.devi/notes.txt
}

function lxx {
	readable $1 | lynx -stdin
}

bindkey -v
set blink-matching-paren on
export KEYTIMEOUT=1
export VIRTUAL_ENV_DISABLE_PROMPT=yes

#nvm
export NVM_DIR="/home/devi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# OPAM configuration
. /home/devi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Nix
# . /home/devi/.nix-profile/etc/profile.d/nix.sh

# fixes the weird delete key behaviour in vi mode
#bindkey "[3~" delete-char

# make normal mode the default mode
# zle-line-init() {zle -K vicmd;}
# zle -N zle-line-init

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# jellybeans takes forever to load. iceberg is very fast.
function vman {
  vim -c "Man $1 $2" -c 'silent only' -c 'colo iceberg' -c 'highlight Normal ctermbg=None' -c 'highlight lineNr ctermbg=16' -c 'hi EndOfBuffer ctermbg=16'
}

function ddig {
  if [[ "$2" == "" ]];then
    docker exec -it $(docker ps | grep "\b$1\b" | gawk '{print $1}') bash
  else
    docker exec -it $(docker ps | grep "\b$1\b" | gawk '{print $1}') $2
  fi
}

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD

# eval "$(goenv init -)"
# export PATH="$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"

function fzf_postit() {
  cat ~/scripts/postit | fzf-tmux -p 70%,70% -- --bind 'enter:execute(tmux set-buffer {})+accept'
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# this should be here before the end
bindkey ' ' autosuggest-accept
bindkey -s '' 'fzf_postit'

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
  cut -c4- | sed 's/.* -> //'
}

_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
}

_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d$'\t' -f1
}

_gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
  cut -d: -f1
}
