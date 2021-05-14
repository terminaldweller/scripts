# Path to your oh-my-zsh installation.
  export ZSH=/home/bloodstalker/.oh-my-zsh

ZSH_THEME="devi"

COMPLETION_WAITING_DOTS="true"

plugins=(git svn zsh-syntax-highlighting autojump virtualenv virtualenvwrapper cargo nvm npm docker rustup zle-vi-visual zsh-autosuggestions zsh-kubectl-prompt kubectl docker-compose)

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/bloodstalker/.local/bin:/home/bloodstalker/bin"

source $ZSH/oh-my-zsh.sh

[[ -s /home/bloodstalker/.autojump/etc/profile.d/autojump.sh ]] && source /home/bloodstalker/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

alias devihome=/home/bloodstalker/devi/hell
alias devihome1=/home/bloodstalker/devi/hell1
alias devihome2=/home/bloodstalker/devi/hell2
alias devihome3=/home/bloodstalker/devi/hell3
alias "$SHELL"="echo $SHELL"
#alias clang="/home/bloodstalker/llvm/llvm/build/bin/clang"
#alias clang++="/home/bloodstalker/llvm/llvm/build/bin/clang++"
#alias llvm-config="/home/bloodstalker/llvm/llvm/build/bin/llvm-config"
#alias "clang-query"="/home/bloodstalker/llvm/llvm/build/bin/clang-query"
alias la="ls -A"
alias ee="nautilus ."
#aliias "clang-format"="/home/bloodstalker/llvm/llvm/build/bin/clang-format"
alias updaterc="cp ~/scripts/.zshrc ~/.zshrc"
alias fixvimrc='cp ~/scripts/.vimrc ~/.vimrc'
alias fixtmuxrc='cp ~/scripts/.tmux.conf ~/.tmux.conf'
alias fixtmuxpowerline='cp ~/scripts/default.sh ~/tmux-powerline/themes/default.sh'
alias fixctagsrc='cp ~/scripts/.ctags ~/.ctags'
alias fixtvrc='cp ~/scripts/.tvrc ~/.tvrc'
alias tmuxpowerline='vim ~/scripts/default.sh'
alias lss="ls -s"
alias speedtest="curl -o /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip"
alias zshrc="vim ~/scripts/.zshrc"
alias vimrc="vim ~/scripts/.vimrc"
alias tmuxrc="vim ~/scripts/.tmux.conf"
alias zshtheme="vim ~/scripts/devi.zsh-theme"
alias quit="exit"
alias xx="dtrx"
alias angband="/home/bloodstalker/angband-4.1.0/angband-master/src/angband"
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
alias telebot="/home/bloodstalker/scripts/telebot.py > /dev/null 2>&1 &"
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
alias mupdf="/home/bloodstalker/extra/mupdf/build/release/mupdf-x11 -D red -P black -I"
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
alias irssi="irssi -n bloodstalker"
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

#autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5fff,bg=#000000,bold"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

function lemon {
  /home/bloodstalker/scripts/lemonbar.sh | lemonbar -f "DejaVu Sans Mono for Powerline:size=11" -g "x16"
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
STARDICT_DATA_DIR="/home/bloodstalker/.stardict"
export STARDICT_DATA_DIR
export DISPLAY=":0"
export WWW_HOME="duckduckgo.com"
alias def="sdcv --color"
#goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

export LESS='-R'
export LESSOPEN='|~/scripts/lesscolor.sh %s'
# libtrash settings
export LD_PRELOAD=/usr/local/lib/libtrash.so.3.5
alias trashon=”export TRASH_OFF=NO”
alias trashoff=”export TRASH_OFF=YES”

export BAT_THEME="Solarized (light)"

export FZF_DEFAULT_OPTS="--color fg:7,bg:0,hl:31,fg+:24,bg+:0,hl+:63,info:208,prompt:196,spinner:24,pointer:24,marker:22"

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

export PATH=$PATH:/home/bloodstalker/extra/cov-analysis-linux64-2019.03/bin
#export PATH=:$PATH:/home/bloodstalker/extra/llvm-6/build/bin
#export PATH=:$PATH:/home/bloodstalker/devi/abbatoir/hole145/llvm7/build/bin
#export PATH=:$PATH:/home/bloodstalker/extra/llvm-clang-4/build/bin
#export PATH=:$PATH:/home/bloodstalker/extra/llvm-clang-4/build/lib
export PATH=:$PATH:/home/bloodstalker/extra/llvm-11/llvm-project/build/bin
export PATH=:$PATH:/home/bloodstalker/extra/llvm-11/llvm-project/build/lib
export PATH=:$PATH:/home/bloodstalker/arcanist/arcanist/bin
export PATH=:$PATH:/home/bloodstalker/devi/abbatoir/hole58/solidity_0.4.18/build/solc
export PATH=:$PATH:/home/bloodstalker/binaryen/bin
export PATH=:$PATH:/home/bloodstalker/extra/go-ethereum/build/bin
export PATH=:$PATH:/home/bloodstalker/.cargo/bin
export PATH=:$PATH:/home/bloodstalker/extra/parity/target/release
export PATH=:$PATH:/home/bloodstalker/extra/wasm-jit-prototype/build/bin
export PATH=:$PATH:/home/bloodstalker/scripts/bin
export PATH=:$PATH:/home/bloodstalker/extra/android-ndk/android-ndk-r16b
export PATH=:$PATH:/home/bloodstalker/.cargo/bin/racer
export PATH=:$PATH:/home/bloodstalker/extra/phantomjs-2.1.1-linux-i686/bin
export PATH=:$PATH:/home/bloodstalker/rigetti/forest-sdk_2.0.1-linux-barebones
export PATH=:$PATH:/home/bloodstalker/extra/tg/bin
export PATH=:$PATH:/home/bloodstalker/extra/Nim/bin
export PATH=:$PATH:/home/bloodstalker/extra/geckodriver
export PATH=:$PATH:/home/bloodstalker/extra/cppcheck
export PATH=:$PATH:/home/bloodstalker/extra/binaryen-version_91
export PATH=:$PATH:/home/bloodstalker/extra/wabt-1.0.13/
export PATH=:$PATH:/home/bloodstalker/devi/tabbed/tabbed-0.6
export PATH=:$PATH:/home/bloodstalker/.dvm/bin
#emscripten
export PATH=:$PATH:/home/bloodstalker/extra/emscripten
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/clang/tag-e1.39.11/build_tag-e1.39.11_64/bin
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/node/8.9.1_64bit/bin
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/emscripten/tag-1.39.11
export PATH=:$PATH:/home/bloodstalker/devi/protoc/protoc-3.13.0-linux-x86_64/bin
export PATH=:$PATH:/home/devi/protobuf/bin/
export PATH=:$PATH:/home/devi/ytfzf/
export PATH=:$PATH:/home/devi/k3s/
export PATH=:$PATH:/home/devi/kompose

export EDITOR=vim
export BROWSER=w3m
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

function dig {
  globalholecounter=0
  if test "$(ls -A "/home/bloodstalker/devi/abbatoir")"; then
    while [ 1 ]; do
      if [ -d "/home/bloodstalker/devi/abbatoir/hole$globalholecounter" ]; then
        # if its not empty
        if test "$(ls -A "/home/bloodstalker/devi/abbatoir/hole$globalholecounter")"; then
          :
        # if its empty
        else
          cd /home/bloodstalker/devi/abbatoir/hole$globalholecounter
          break
        fi
      else
        mkdir /home/bloodstalker/devi/abbatoir/hole$globalholecounter
        cd /home/bloodstalker/devi/abbatoir/hole$globalholecounter
        echo $globalholecounter
        break
      fi
      ((globalholecounter++))
    done
  else
    mkdir /home/bloodstalker/devi/abbatoir
    mkdir /home/bloodstalker/devi/abbatoir/hole$globalholecounter
    cd /home/bloodstalker/devi/abbatoir/hole$globalholecounter
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
export NVM_DIR="/home/bloodstalker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# OPAM configuration
. /home/bloodstalker/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Nix
. /home/bloodstalker/.nix-profile/etc/profile.d/nix.sh

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

eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

function fzf_postit() {
  cat ~/scripts/postit | fzf --bind 'enter:execute(tmux set-buffer {})+accept'
}

# this should be here before the end
bindkey ' ' autosuggest-accept
bindkey -s '' 'fzf_postit'
