#!/usr/bin/env zsh

alias "$SHELL"="echo $SHELL"
alias la="ls -A"
alias ee="nautilus ."
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
alias fixurls="cp ~/scripts/urls ~/.newsbeuter/urls"
alias qtrc="vim ~/scripts/qtbrowser/config.py"
alias fixqtrc="cp ~/scripts/qtbrowser/config.py ~/.config/qutebrowser/config.py"
alias dropcextra="cp ~/scripts/c/devi_extra.h ./devi_extra.h"
alias dropcmain="cp ~/scripts/c/main.c ./"
alias dropcppmain="cp ~/scripts/c/main.cpp ./"
alias tg="telegram-cli"
alias telebot="/home/bloodstalker/scripts/telebot.py > /dev/null 2>&1 &"
alias dw="~/df/df_linux/df"
alias clean="clear"
alias hplovecraft="lynx http://www.hplovecraft.com/writings/texts/"
alias casmith="lynx http://www.eldritchdark.com/writings/short-stories/"
alias tt="transmission-cli -u 1 -w ~/winshare/"
alias mv="mv -i"
alias cp="cp -i"
alias nuke="rm -rf * .[!.]* ..?*"
alias lynx="lynx -lss ~/scripts/lynx.lss -cfg ~/scripts/lynx.cfg -prettysrc"
alias bruiser="bruiser --history ~/.bruiser/history.lua"
alias digg="dig && clear"
alias ogg="ogg123"
alias jupyterlocal="jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8775"
alias mupdf="/home/bloodstalker/extra/mupdf/build/release/mupdf-x11 -D red -P black -I"
alias googler="~/extra/googler/googler --colors GKmexy -c us -l en --count 7 --exact "
alias ddgr="ddgr --colorize always -r us-en -n 15"
alias pirate-get="pirate-get -S ~/magnets/"
alias vps="ssh 5.56.132.89 -l ubuntu"
alias pytags="ctags --fields=+l --languages=python --python-kinds=-iv -R ."
alias v="vim"
alias kshrc="vim ~/scripts/.kshrc"
alias fixkshrc="cp ~/scripts/.kshrc ~/.kshrc"
alias rangerrc="vim ~/scripts/.config/ranger/rc.conf"
alias fixrangerrc="cp ~/scripts/.config/ranger/rc.conf ~/.config/ranger/rc.conf"
alias zathurarc="vim ~/scripts/zathurarc"
alias fixzathurarc="cp ~/scripts/zathurarc ~/.config/zathura/"

function math {
  echo $(($@))
}

REPORTTIME=4
STARDICT_DATA_DIR="/home/bloodstalker/.stardict"
export STARDICT_DATA_DIR
alias def="sdcv --color"

export LESS='-R'
export LESSOPEN='|~/scripts/lesscolor.sh %s'

export PATH=$PATH:/home/bloodstalker/extra/cov-analysis-linux64-2019.03/bin
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
export PATH=:$PATH:/home/bloodstalker/extra/emscripten
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/clang/tag-e1.39.11/build_tag-e1.39.11_64/bin
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/node/8.9.1_64bit/bin
export PATH=:$PATH:/home/bloodstalker/extra/emscripten/emscripten/tag-1.39.11

export EDITOR=vim
export BROWSER=lynx
