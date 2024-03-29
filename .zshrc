### Added by Zinit's installer
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi

# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

export ZSH=/home/devi/.oh-my-zsh
zmodload zsh/zprof

ZSH_THEME="devi"

COMPLETION_WAITING_DOTS="false"

plugins=(git evalcache zsh-syntax-highlighting autojump virtualenv virtualenvwrapper rust npm docker zsh-autosuggestions zsh-kubectl-prompt kubectl docker-compose vagrant golang zsh-prompt-benchmark)

# https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true

zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' stagedstr         "+"
zstyle ':vcs_info:*:*' unstagedstr       "!"

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*+set-message:*' hooks git-st
zstyle ':vcs_info:git*+set-message:*' hooks git-remotebranch

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' [%s|%b %u%c%a:%r]'
zstyle ':vcs_info:git:*' actionformats '(%s|%b|%a%u%c:%r)'

# https://opensource.apple.com/source/zsh/zsh-61/zsh/Misc/vcs_info-examples.auto.html
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='T'
    fi
}
+vi-git-st() {
    local ahead behind
    local -a gitstatus
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" )
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" )
    hook_com[misc]+=${(j:/:)gitstatus}
}
+vi-git-remotebranch() {
    local remote
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        hook_com[branch]="${hook_com[branch]} [${remote}]"
    fi
}

declare -U path

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}
zcompile-many ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
zcompile-many ~/zsh-async.git/v1.8.5/async.zsh

# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

# plugins=(git evalcache fast-syntax-highlighting autojump virtualenv virtualenvwrapper rust docker zsh-autosuggestions zsh-kubectl-prompt kubectl docker-compose vagrant golang zsh-prompt-benchmark)
bindkey " " autosuggest-accept
# zinit ice wait lucid atload'_zsh_kubectl_prompt_precmd'
# zinit load superbrothers/zsh-kubectl-prompt
# zinit ice wait lucid atload'_zsh_highlight_call_widget'
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit ice wait lucid atload'_zsh_autosuggest_start' atload'bindkey " " autosuggest-accept'
# zinit light zsh-users/zsh-autosuggestions
# zinit load mroth/evalcache
# zinit light Aloxaf/fzf-tab
# zi snippet OMZP::git
# zi snippet OMZP::virtualenv
# zi snippet OMZP::virtualenvwrapper
# zi snippet OMZP::docker
# zi snippet OMZP::kubectl
# zi snippet OMZP::docker-compose
# zi snippet OMZP::vagrant
# zi snippet OMZP::golang

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/devi/.local/bin:/home/devi/bin"

source $ZSH/oh-my-zsh.sh

[[ -s /home/devi/.autojump/etc/profile.d/autojump.sh ]] && source /home/devi/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# create LS_COLORS
eval `dircolors ~/.dir_colors`
# _evalcache dircolors ~/.dir_colors

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
alias py="python"
# enable aliases with sudo in the alias
# alias git="proxychains4 -q -f ~/proxies/ice/proxychains.conf git"
alias sudo="sudo "
alias mpv="proxychains4 -q -f ~/proxies/68/proxychains.conf mpv --save-position-on-quit --term-osd-bar --msg-module --msg-time --cache=yes --cache-secs=37500 --cache-on-disk --cache-dir=/tmp/ --demuxer-max-bytes=500MiB"
alias w3m='proxychains4 -q -f ~/proxies/ice/proxychains.conf w3m -s -W -4 -o auto_image=FALSE -o user_agent="$(get_random_ua.sh)" -graph'
alias torw3m='torsocks --port 9053 w3m -o auto_image=FALSE -o user_agent="$(get_random_ua.sh)" -graph'
alias boxed_w3m="ssh -tt -i /home/devi/devi/vagrantboxes.git/main/netbsd9/.vagrant/machines/default/libvirt/private_key vagrant@w3m-host.vagrant-libvirt torsocks --address 192.168.1.214 --port 9054 w3m -s -W -4 -o -graph"
alias i2pw3m='proxychains4 -q -f ~/proxies/i2p_one/proxychains.conf w3m -o auto_image=FALSE -o user_agent="$(get_random_ua.sh)" -graph'
alias rm="rm -I --one-file-system --preserve-root=all"
alias vv="vim"
alias ls="exa"
alias l="ls"
# alias ls="ls --color=auto"
alias la="exa -a"
# alias la="ls -A"
alias ll="exa -abghHliSmxFuU --color-scale --git -@"
# alias ll="\ls -lZspihbFA --color=never --full-time --author | colcol | column -t"
alias lss="exa -Sls=size"
# alias lss="ls -sASh"
alias ee="thunar ."
alias updaterc="cp ~/scripts/.zshrc ~/.zshrc"
alias fixvimrc='cp ~/scripts/.vimrc ~/.vimrc'
alias fixtmuxrc='cp ~/scripts/.tmux.conf ~/.tmux.conf'
# alias fixtmuxpowerline='cp ~/scripts/default.sh ~/tmux-powerline/themes/default.sh'
alias fixctagsrc='cp ~/scripts/.ctags ~/.ctags'
# alias fixtvrc='cp ~/scripts/.tvrc ~/.tvrc'
# alias tmuxpowerline='vim ~/scripts/default.sh'
alias speedtest="curl --connect-timeout 10 -o /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip"
alias zshrc="vim ~/scripts/.zshrc"
alias vimrc="vim ~/scripts/.vimrc"
alias tmuxrc="vim ~/scripts/.tmux.conf"
alias zshtheme="vim ~/scripts/devi.zsh-theme"
alias quit="exit"
# alias xx="dtrx"
# alias angband="/home/devi/angband-4.1.0/angband-master/src/angband"
# alias startdocker="sudo systemctl start docker"
# alias vv="vim"
# alias mm="cmatrix -s -C blue"
alias contest="ping 4.2.2.4 -c 7; ping google.com -c 7"
# alias solide="vim ~/scripts/makefile"
# alias dropsolide="cp ~/scripts/makefile ./"
# alias genjctags="find . -type f -iregex \".*\.js$\" -not -path \"./node_modules/*\" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags"
# alias isup="ps -aux | grep "
alias ipfsd="ipfs daemon > /dev/null 2>&1 &; disown"
alias i3rc="vim ~/scripts/.config/i3/config"
alias fixi3rc="cp ~/scripts/.config/i3/config ~/.config/i3/config && i3-msg restart"
alias muttrc="vim ~/scripts/.mutt/.muttrc"
alias fixmuttrc="cp ~/scripts/.mutt/.muttrc ~/.muttrc"
alias dropcmake="cp ~/scripts/makefilec ./makefile"
alias dropcppmake="cp ~/scripts/makefilecpp ./makefile"
alias droppy="cp ~/scripts/python/main.py ./main.py"
alias diff="colordiff"
# alias yy="~/scripts/hived"
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
# alias dw="~/df/df_linux/df"
alias clean="clear"
alias lynx="lynx -lss ~/scripts/lynx.lss -cfg ~/scripts/lynx.cfg -prettysrc"
alias hplovecraft="w3m http://www.hplovecraft.com/writings/texts/"
alias casmith="w3m http://www.eldritchdark.com/writings/short-stories/"
# alias tt="transmission-cli -u 1 -w ~/winshare/"
#alias make="colormake"
#alias gcc="COLORMAKE_COMMAND=gcc colormake"
#alias clang="COLORMAKE_COMMAND=clang colormake"
alias mv="mv -i"
alias cp="cp -i"
alias nuke="rm -rf .[^.]* *"
alias bruiser="bruiser --history ~/.bruiser/history.lua"
alias digg="dig && clear"
alias bburrow="burrow && clear"
alias ogg="ogg123"
alias mupdf="/home/devi/extra/mupdf/build/release/mupdf-x11 -D red -P black -I"
alias googler="~/extra/googler/googler --colors GKmexy -c us -l en --count 7 --exact "
alias ddgr="ddgr --colorize always -r us-en -n 15"
# alias pirate-get="pirate-get -S ~/magnets/"
alias vps="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt 87.236.209.206 -l ubuntu -p 1022"
alias vpn="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt 192.99.102.52 -l rooot -p 1022"
alias vpn2="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt 145.239.165.137 -l rooot"
# alias vpn3="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -o StrictHostKeyChecking=yes -o UserKnownHostsFile=/dev/null -o VerifyHostKeyDNS=yes root@jump3.terminaldweller.com -p 2022"
alias vpn3="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 2022 root@185.112.147.110"
alias vpn6="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.130.45.46"
alias vpn7="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.130.47.81"
alias vpn8="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.130.47.208"
alias vpn9="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -i ~/.ssh/id_rsa -p 3333 ubuntu@185.130.47.81 ssh -tt -i /home/ubuntu/.ssh/id_rsa_lv2 2a07:e01:3:1c4::1 -p 3333 -l ubuntu"
alias vms="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt 185.126.202.69 -l ubuntu -p 1022"
alias vpnvv="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.244.29.79"
alias vpn10="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333  root@89.147.110.30"
alias vpnj="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.130.46.113"
alias vpng="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 root@65.109.235.54"
alias -g DOCKER_HOST_VPS="ssh://ubuntu@87.236.209.206:1022"
alias -g DOCKER_HOST_VPN="ssh://rooot@192.99.102.52:1022"
alias -g DOCKER_HOST_VPN2="ssh://rooot@145.239.165.137:22"
alias -g DOCKER_HOST_VPN3="ssh://root@185.112.147.110:2022"
alias -g DOCKER_HOST_VPN6="ssh://ubuntu@185.130.45.46:3333"
alias -g DOCKER_HOST_VPN7="ssh://ubuntu@185.130.47.81:3333"
alias -g DOCKER_HOST_VPN8="ssh://ubuntu@185.130.47.208:3333"
# alias -g DOCKER_HOST_VPN9=""
alias -g DOCKER_HOST_VMS="ssh://ubuntu@185.126.202.69:1022"
alias -g DOCKER_HOST_VPN10="ssh://root@89.147.110.30:3333"
# alias cloud_one="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh 130.185.121.80 -l ubuntu -p 1022"
# alias pytags="ctags --fields=+l --languages=python --python-kinds=-iv -R ."
alias v="vim"
alias kshrc="vim ~/scripts/.kshrc"
alias fixkshrc="cp ~/scripts/.kshrc ~/.kshrc"
alias rangerrc="vim ~/scripts/.config/ranger/rc.conf"
alias fixrangerrc="cp ~/scripts/.config/ranger/rc.conf ~/.config/ranger/rc.conf"
alias riflerc="vim ~/scripts/.config/ranger/rifle.conf"
alias fixriflerc="cp ~/scripts/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf"
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
alias jupyterlab="jupyter lab --no-browser --port 9989"
alias iredisrc="vim ~/scripts/.iredisrc"
alias fixiredisrc="cp ~/scripts/.iredisrc ~/.iredisrc"
# alias irssi="TERM=screen-256color docker run --runtime=runsc -it -e TERM -u $(id -u):$(id -g) --log-driver=none -e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -v $HOME/.irssi:/home/user/.irssi:ro -v /etc/localtime:/etc/localtime:ro devi_irssi"
alias irssi="TERM=screen-256color COLORTERM=truecolor docker run --runtime=runsc -it -e COLORTERM -e TERM -u $(id -u):$(id -g) --log-driver=none -v $HOME/.irssi-home:/home/user:ro -v /etc/localtime:/etc/localtime:ro -v $HOME/.irssi-home/.irssi/otr:/home/user/.irssi/otr devi_irssi"
alias tor_irssi="TERM=screen-256color docker run --runtime=runsc -it -e TERM -u 1001:1001 --log-driver=none -v tor_irssi_mount:/home/user/.irssi -v ~/devi/abbatoir/hole16:/home/user/.irssi/certs tor_irssi"
alias i2p_irssi="TERM=screen-256color docker run --runtime=runsc -it -e TERM -u $(id -u):$(id -g) --log-driver=none -v i2p_irssi_mount:/home/user/.irssi irssi:1.2.3"
alias openbb="TERM=screen-256color \
  docker \
  run \
  --runtime=runc \
  -it \
  --env-file=/home/devi/.openbb/.env \
  -e TERM \
  -e DISPLAY=${DISPLAY} \
  -e OPENBB_BACKEND=Qt5Agg \
  -e ALL_PROXY=socks5h://192.168.1.214:9995 \
  -e HTTP_PROXY=socks5h://192.168.1.214:9995 \
  -e HTTPS_PROXY=socks5h://192.168.1.214:9995 \
  -e NO_PROXY=localhost,127.0.0.0/8,dockerhost.local,172.16.0.0/16,10.0.0.0/8,192.168.0.0/16 \
  -e all_proxy=socks5h://192.168.1.214:9995 \
  -e http_proxy=socks5h://192.168.1.214:9995 \
  -e https_proxy=socks5h://192.168.1.214:9995 \
  -e no_proxy=localhost,127.0.0.0/8,dockerhost.local,172.16.0.0/16,10.0.0.0/8.19.168.0.0/16 \
  --log-driver=none \
  --network=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  ghcr.io/openbb-finance/openbbterminal-poetry:latest"
alias joplinkeymap="vim ~/scripts/.config/joplin/keymap.json"
alias fixjoplinkeymap="cp ~/scripts/.config/joplin/keymap.json ~/.config/joplin/keymap.json"
alias postitrc="vim ~/scripts/postit"
alias rainbowrc="vim ~/scripts/.rainbow_config.json"
alias fixrainbowrc="cp ~/scripts/.rainbow_config.json ~/.rainbow_config.json"
alias irssiconfig="vim ~/scripts/irssi/config"
alias irssitheme="vim ~/scripts/irssi/solarized-powerline.theme"
alias irssistartup="vim ~/scripts/irssi/startup"
alias fixirssiconfig="cp ~/scripts/irssi/config ~/.irssi-home/.irssi/config"
alias fixirssitheme="cp ~/scripts/irssi/solarized-powerline.theme ~/.irssi-home/.irssi/solarized-powerline.theme"
alias fixirssistartup="cp ~/scripts/irssi/startup ~/.irssi-home/.irssi/startup"
alias w3mlastsession="~/.w3m/bin/w3mlastsession"
alias lsdrc="vim ~/scripts/.config/lsd/config.yaml"
alias fixlsdrc="cp ~/scripts/.config/lsd/config.yaml ~/.config/lsd/config.yaml"
alias cygwin="/mnt/d/home/apps/cygwin/bin/bash.exe -l -i"
alias farmanager="/mnt/c/Program\ Files/Far\ Manager/Far.exe"
alias wincmd="/mnt/c/Windows/System32/runas.exe /profile /user:administrator cmd.exe"
alias xonshrc="vim ~/scripts/.xonshrc"
alias fixxonshrc="cp ~/scripts/.xonshrc ~/.xonshrc"
alias deviphone="ssh -p 8022 u0_a601@farzad-s-galaxy-a51.lan"
alias rpiz2="ssh 192.168.1.205 -l pi"
alias rpiz13="ssh 192.168.1.101 -l root"
alias moshvpn="mosh rooot@192.99.102.52 --ssh='ssh -p 1022'"
alias moshvps="mosh ubuntu@terminaldweller.com --ssh='ssh -p 1022'"
alias proxychainsrc="vim ~/scripts/.proxychains/proxychains.conf"
alias fixproxychainsrc="cp ~/scripts/.proxychains/proxychains.conf ~/.proxychains/proxychains.conf"
alias zgit="proxychains4 git"
alias zssh="proxychains4 ssh"
alias zscp="proxychains4 scp"
alias ztelnet="proxychains4 telnet"
alias socks5z="ssh -N -D 9998 -o ExitOnForwardFailure=yes -l pi 192.168.1.108"
alias socks5ir="autossh -M 0 -N -D 9997 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 1022 87.236.209.206"
alias socks5vpn1="autossh -M 0 -N -D 9999 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l rooot 145.239.165.137"
alias socks5vpn2="autossh -M 0 -N -D 9996 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l rooot -p 1022 192.99.102.52"
alias socks5vpn3="autossh -M 0 -N -D 0.0.0.0:9995 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o VerifyHostKeyDNS=no -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l root -p 2022 185.112.147.110"
alias socks5vpn4="autossh -M 0 -N -D 9994 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 1022 130.185.121.80"
alias socks5vpn5="autossh -M 0 -N -D 0.0.0.0:9990 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.45.46"
alias socks5vpn6="autossh -M 0 -N -D 9993 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -6 -l ubuntu -p 3333 2a07:e01:3:204::1"
alias socks5vpn7="autossh -M 0 -N -D 9992 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 130.185.47.81"
alias socks5vpn8="autossh -M 0 -N -D 0.0.0.0:9989 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.47.208"
alias tormapped6="autossh -M 0 -N -L 9053:127.0.0.1:9050 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.45.46"
alias tormapped8="autossh -M 0 -N -L 0.0.0.0:9054:127.0.0.1:9050 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.47.208"
alias i2pmappedserver6="autossh -M 0 -N -L 0.0.0.0:9066:127.0.0.1:7070 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.45.46"
alias i2pmapped6http="autossh -M 0 -N -L 0.0.0.0:9064:127.0.0.1:4444 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.45.46"
alias i2pmapped6socks="autossh -M 0 -N -L 0.0.0.0:9067:127.0.0.1:4447 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.45.46"
alias i2pmappedserver8="autossh -M 0 -N -L 0.0.0.0:9166:127.0.0.1:7070 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.47.208"
alias i2pmapped8http="autossh -M 0 -N -L 0.0.0.0:9164:127.0.0.1:4444 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.47.208"
alias i2pmapped8socks="autossh -M 0 -N -L 0.0.0.0:9167:127.0.0.1:4447 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 3333 185.130.47.208"
alias haproxy_prompammed="autossh -M 0 -N -L 0.0.0.0:9099:127.0.0.1:9099 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -l ubuntu -p 1022 87.236.209.206"
alias k9sskin="vim ~/scripts/.k9s/skin.yml"
alias k9sconfig="vim ~/scripts/.k9s/config.yml"
alias fixk9sskin="cp ~/scripts/.k9s/skin.yml ~/.config/k9s/skin.yml"
alias fixk9sconfig="cp ~/scripts/.k9s/config.yml ~/.config/k9s/config.yml"
alias gottyrc="vim ~/scripts/.gotty"
alias fixgottyrc="cp ~/scripts/.gotty ~/.gotty"
alias dircolorsrc="vim ~/scripts/.dir_colors"
alias fixdircolorsrc="cp ~/scripts/.dir_colors ~/.dir_colors"
alias inputrc="vim ~/scripts/.inputrc"
alias fixinputrc="cp ~/scripts/.inputrc ~/.inputrc"
alias gdbinit="vim ~/scripts/.gdbinit"
alias fixgdbinit="cp ~/scripts/.gdbinit ~/.gdbinit"
alias d="ALL_PROXY=socks5h://127.0.0.1:9995 grc docker"
alias dc="ALL_PROXY=socks5h://127.0.0.1:9995 grc docker-compose"
alias zh_freebsd="zssh dev@192.168.90.15"
alias zh_linux="zssh dev@192.168.90.17"
alias zh_router_root="zssh root@192.168.90.71"
alias zh_router_admin="zssh admin@192.168.90.71"
alias youtube_dl="proxychains4 -f /home/devi/proxies/ice/proxychains.conf youtube-dl"
# alias campv="proxychains4 -f /home/devi/proxies/ca/proxychains.conf mpv --no-video"
alias tormpv="torsocks --port 9054 mpv --no-video"
alias youtube144="mpv --ytdl-format=160+249"
alias youtube360="mpv --ytdl-format=243+250"
alias youtube480="mpv --ytdl-format=244+140"
alias tridactylrc="vim ~/scripts/.tridactylrc"
alias fixtridactylrc="cp ~/scripts/.tridactylrc ~/"
alias man="man -O width=210"
alias getmangas="proxychains4 -q -f ~/proxies/ice/proxychains.conf kaminokumo --manga"
alias getanimes="proxychains4 -q -f ~/proxies/ice/proxychains.conf kaminokumo --anime"
alias gdb="gdb -q"
alias bashrc="vim ~/scripts/.bashrc"
alias fixbashrc="cp ~/scripts/.bashrc ~/"
alias offlineimaprc="vim ~/scripts/.offlineimaprc"
alias fixofflineimaprc="cp ~/scripts/.offlineimaprc ~/"
alias screenrc="vim ~/scripts/.screenrc"
alias fixscreenrc="cp ~/scripts/.screenrc ~/"
alias xresources="vim ~/scripts/.Xresources"
alias fixxresources="cp ~/scripts/.Xresources ~/.Xresources && xrdb -merge ~/.Xresources"
alias qutebrowserrc="vim ~/scripts/qtbrowser/config.py"
alias fixqutebrowserrc="cp ~/scripts/qtbrowser/config.py ~/.config/qutebrowser/config.py"
alias pulsemixer="pulsemixer --color 1"
# alias vagrant="https_proxy=http://[::1]:8118 vagrant --color --timestamp"
alias vagrant="vagrant --color --timestamp"
alias vm_disposable="cp ~/scripts/vagrant/disposable/Vagrantfile ."
alias vm_disposable_alpine="cp ~/scripts/vagrant/disposable-alpine/Vagrantfile ."
alias checktor="curl --socks5 localhost:9054 --socks5-hostname localhost:9050 -s https://check.torproject.org/api/ip"
alias ip="grc ip"
alias ipp="ip -s -s -d"
alias zathura="tabbed -c -r 2 zathura -e id"
alias ytfzf="proxychains4 -q -f ~/proxies/ice/proxychains.conf ytfzf"
alias newsboat="proxychains4 -q -f ~/proxies/ice/proxychains.conf newsboat"
alias dud="du -hcD --max-depth=1 | sort -hr | colcol | column -t"
alias bbox="busybox"
alias gitconfigrc="vim ~/scripts/.gitconfig"
alias fixgitconfigrc="cp ~/scripts/.gitconfig ~/.gitconfig"
alias nviminit="nvim ~/scripts/init.vim"
alias fixnviminit="cp ~/scripts/init.vim ~/.config/nvim/init.vim"
alias mysql='mysql --safe-updates --prompt="\u@\h [\d]>"'
alias socat="socat -d -d"
alias cmusrc="vim ~/scripts/.config/cmus/rc"
alias fixcmusrc="cp ~/scripts/.config/cmus/rc ~/.config/cmus/rc"
# alias cointop="proxychains4 -q -f ~/proxies/ice/proxychains.conf ssh -tt -p 3333 ubuntu@185.130.45.46 TERM=screen-256color /home/ubuntu/cointop/cointop"
alias cointop="proxychains4 -q -f ~/proxies/ice/proxychains.conf autossh -M 0 -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -tt -p 3333 ubuntu@185.130.45.46 TERM=screen-256color /home/ubuntu/cointop/cointop"
alias zshenv="vim ~/scripts/.zshenv"
alias fixzshenv="cp ~/scripts/.zshenv ~/.zshenv"
alias postman="flatpak run com.getpostman.Postman"
alias skype="flatpak run com.skype.Client"
alias chromium_flatpak="flatpak run org.chromium.Chromium"
alias firefox_flatpak="flatpak run org.mozilla.firefox"
alias librewolf_flatpak="flatpak run io.gitlab.librewolf-community"
alias tree="tree -lxaCDpugh -L 10 --gitignore | less -r"
alias lsblk="grc lsblk -Dfp"
alias k="grc kubectl"
alias run_devdocs_server="docker run -p 9292:9292 devdocs"
alias voiddocs="w3m /usr/share/doc/void/html/index.html"
alias archwiki="python -m http.server --directory /home/devi/chroots/arch/usr/share/doc/arch-wiki/html"
# alias bombadillo="proxychains4 -q -f ~/proxies/ice/proxychains.conf bombadillo -t"
alias record_desktop="recordmydesktop --device hw:1,0 --no-wm-check -x 1920 --width 1920 --height 1080 --fps 15"
alias mongoshrc="vim ~/scripts/.mongoshrc.js"
alias fixmongoshrc="cp ~/scripts/.mongoshrc.js ~/.mongoshrc.js"
alias phone_net="sudo ip netns exec phone_ns"
alias home_net="sudo ip netns exec home_ns"
alias netbsd_bmake="/usr/pkg/bin/bmake"
alias hive_node_1="ssh ubuntu@95.217.143.98"
alias j_proxy="proxychains4 -q -f ~/proxies/j/proxychains.conf"
alias ca_proxy="proxychains4 -q -f ~/proxies/ca/proxychains.conf"
alias fr_proxy="proxychains4 -q -f ~/proxies/fr/proxychains.conf"
alias nd_proxy="proxychains4 -q -f ~/proxies/nd/proxychains.conf"
alias nd2_proxy="proxychains4 -q -f ~/proxies/nd2/proxychains.conf"
alias swe_proxy="proxychains4 -q -f ~/proxies/swe/proxychains.conf"
alias ir_proxy="proxychains4 -q -f ~/proxies/ir/proxychains.conf"
alias ice_proxy="proxychains4 -q -f ~/proxies/ice/proxychains.conf"
alias tor_one_proxy="proxychains4 -q -f ~/proxies/tor_one/proxychains.conf"
alias tor_two_proxy="proxychains4 -q -f ~/proxies/tor_two/proxychains.conf"
alias tor_three_proxy="proxychains4 -q -f ~/proxies/tor_threece/proxychains.conf"
alias tor_carrier_proxy="proxychains4 -q -f ~/proxies/tor_carrier/proxychains.conf"
alias six_6_proxy="proxychains4 -q -f ~/proxies/66/proxychains.conf"
alias six_7_proxy="proxychains4 -q -f ~/proxies/67/proxychains.conf"
alias six_8_proxy="proxychains4 -q -f ~/proxies/68/proxychains.conf"
alias six_9_proxy="proxychains4 -q -f ~/proxies/69/proxychains.conf"
alias six_v_proxy="proxychains4 -q -f ~/proxies/6v/proxychains.conf"
alias six_j_proxy="proxychains4 -q -f ~/proxies/6j/proxychains.conf"
alias glow="glow --style ~/.config/glow/dark.json --pager --local"
alias nmap="grc nmap"
alias fdisk="grc fdisk"
alias blkid="grc blkid"
alias b="buku --suggest"
alias whois="grc whois -H"
alias scapy="scapy -H"
alias dg="grc /usr/bin/dig"
alias lsof="grc lsof"
alias xxd="xxd -g 2 -E -u -c 32"
alias torcurl='curl -s --connect-timeout 10 --user-agent "$(get_random_ua.sh)" --socks5 localhost:9053'
alias gpg2="HTTP_PROXY=socks5://127.0.0.1:9995 HTTPS_PROXY=socks5://127.0.0.1:9995 gpg2"
alias gpg="HTTP_PROXY=socks5://127.0.0.1:9995 HTTPS_PROXY=socks5://127.0.0.1:9995 gpg"
# alias lxctop='watch -x -c -d -t -n 5 lxc list -c n,t,4,a,b,u,e,D,m,S,s,P'
alias lxctop='watch -x -c -d -t -n 5 lxc list -c n,t,4,volatile.eth0.hwaddr:MAC,a,b,u,e,D,m,S,s,P -f compact type=container status=running'
alias iptables="grc iptables"
alias ping="grc ping"
alias list_iptables="sudo iptables -nvL --line-numbers"
alias sensors_pp="sensors -A -j 2> /dev/null | json_pp -json_opt pretty,canonical | pygmentize -l json -P style=$PYGMENTIZE_STYLE | $PAGER"
alias vdiff="vimdiff"
# alias virt-top="/nix/store/gn20hprla1p86fkvml4c6im3839vmlzn-virt-top-1.1.1/bin/virt-top"
alias finger="/nix/store/rqc8gdpx6dzwk38dx01ddb4kfcrkyiwq-bsd-finger-0.17/bin"
alias fox_in_a_box='ssh -o Compression=no -X -i /home/devi/devi/vagrantboxes.git/main/dispffox/.vagrant/machines/default/libvirt/private_key vagrant@virt-dispffox.vagrant-libvirt "XAUTHORITY=/home/vagrant/.Xauthority firefox -no-remote"'
alias run_doh_client="sudo doh-client -d doh.terminaldweller.com -r 185.130.47.81:443 -p getnsrecord --proxy-host 127.0.0.1:9995 --proxy-scheme socks5h --timeout 10"
alias bun="ALL_PROXY=socks5h://127.0.0.1:9995 bun"
alias ffox_i2p='ssh -C -X -i /home/devi/devi/vagrantboxes.git/main/i2p/.vagrant/machines/default/libvirt/private_key vagrant@i2p-host.vagrant-libvirt "XAUTHORITY=/home/vagrant/.Xauthority firefox"'
alias sotn="bw_mednafen ~/roms/sotn/Castlevania\ -\ Symphony\ of\ the\ Night.cue"
alias silent_hill="bw_mednafen ~/roms/silent_hill/Silent Hill (v1.1).cue"
alias bombadillo='ssh -tt -i /home/devi/devi/vagrantboxes.git/main/openbsd/.vagrant/machines/default/libvirt/private_key vagrant@bomb-host.vagrant-libvirt proxychains4 -q bombadillo '
alias safe_w3m='ssh -tt -i /home/devi/devi/vagrantboxes.git/main/openbsd/.vagrant/machines/default/libvirt/private_key vagrant@bomb-host.vagrant-libvirt WWW_HOME=searx.terminaldweller.com proxychains4 -q w3m '
alias mount="grc mount"
alias picocom="picocom --escape b"
# https://wiki.slipfox.xyz/wiki/ANSI_escape_code#OSC_(Operating_System_Command)_sequences)
# https://github.com/sos4nt/dynamic-colors
alias turn_green='echo -e "\033]10;#005f5f\007" '
alias turn_blue='echo -e "\033]10;#005f87\007" '
alias turn_white='echo -e "\033]10;#c0c0c0\007" '
alias bandwhich="bandwhich"
alias powertop="powertop"
alias mdcat="mdcat --local --fail --paginate"
alias mariadb="mariadb --safe-updates"
alias tunneltoprc="vim ~/scripts/.tunneltop.toml"
alias fixtunneltoprc="cp ~/scripts/.tunneltop.toml ~/.tunneltop.toml"
alias tokei="tokei --hidden --num-format underscores -s lines"
alias waydroid="WAYLAND_DISPLAY=wayland-0 waydroid"
alias gw="git worktree"
alias redshiftrc="vim ~/scripts/.config/redshift.conf"
alias fixredshiftrc="cp ~/scripts/.config/redshift.conf ~/.config/redshift.conf"
alias waydroid_ssh="ssh -p 8022 u0_a411@192.168.240.112"
alias pn="pnpm"
alias magni="docker run -p 8086:8086 -e HTTPS_PROXY=socks5h://192.168.1.214:9995 -e MAGNI_MODEL_PATH=/opt/magni_models -e MAGNI_IMAGE_PATH=/opt/magni_images -v /tmp/models:/opts/magni_models magni:latest"
alias ff="fzf --preview 'bat --color=always {}'"

unalias gwta
gwta() {
  git worktree add ./"$1" $(git rev-parse "$1")
}

ccgrep() {
  EXTRA_ARG_BEFORE=$(llvm-config --libdir)/clang/$(llvm-config --version)/include
  cgrep --extra-arg-before="-I${EXTRA_ARG_BEFORE}" "$@"
}

# change the 4th terminal color to #0000ff
# echo -e '\e]P40000ff'
# reset all
# echo -e '\e]R'

# mdcat(){
#   mdcat --fail --local "$@" | bat
# }

#autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5fff,bg=#000000,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey " " autosuggest-accept

lemon() {
  /home/devi/scripts/lemonbar.sh | lemonbar -f "DejaVu Sans Mono for Powerline:size=11" -g "x16"
}

docpp() {
  cp ~/scripts/makefilecpp ./makefile
  cp ~/scripts/c/main.cpp ./
  cp ~/scripts/c/header.hpp ./
  # cp ~/scripts/.ycm_extra_config.py ./.ycm_extra_conf.py
  # cp ~/scripts/cfam.vimrc ./.vimrc
  # cp ~/scripts/compiler-explorer/ceconfig.json ./
  # cp ~/scripts/c/debug.dbg ./
}

docc() {
  cp ~/scripts/makefilec ./makefile
  cp ~/scripts/c/main.c ./
  # cp ~/scripts/.ycm_extra_config.py ./.ycm_extra_conf.py
  # cp ~/scripts/cfam.vimrc ./.vimrc
  # cp ~/scripts/compiler-explorer/ceconfig.json ./
  # cp ~/scripts/c/debug.dbg ./
}

pfd() {
  ps aux | grep -v grep | grep "$@"
}

dockernuke() {
  docker stop `docker ps -qa`
  docker rm `docker ps -qa`
  docker rmi -f `docker images -qa `
  docker volume rm $(docker volume ls -qf)
  docker network rm `docker network ls -q`
}

mdvv() {
  mdv -t 729.8953 "$@"
}

gdd() {
  #git --no-pager diff --numstat | gawk \'{print$1$2}\'
  git --no-pager diff --numstat | gawk '{sum1+=$1;sum2+=$2}END{print "additions:"sum1"  ""deletions:"sum2}'
}

math() {
  echo $(($@))
}

fd() {
  # ls -d $(find -O3 -iname "*$1*")
  # local results=$(find -O3 -iname "*$1*")
  ls -d $(find -O3 -iname "*$1*")
}

pss() {
  "ps" $1 | colcol | column -t
}

pdfsearch() {
  REGEX=$1
  shift
  pdfgrep --warn-empty --unac --color=auto -i -e $REGEX -n -C 1 "$@"
}
# function pid {
#   ps -aux | grep "$1" | grep -v grep | awk '{print$2}'
# }

#bicon_on=$(ps -aux | grep bicon | grep -v grep | awk '{print$2}')
#if [[ -z "${bicon_on// }" ]]; then
#  /usr/bin/bicon.bin
#fi

# export SOCKS_PROXY="socks5://127.0.0.1:9050"
REPORTTIME=4
STARDICT_DATA_DIR="/home/devi/.stardict"
export STARDICT_DATA_DIR
export LIBGL_ALWAYS_INDIRECT=1
#export PULSE_SERVER=tcp:192.168.1.103
export WWW_HOME="searx.terminaldweller.com"
# http://download.huzheng.org/
alias def="sdcv --color"
alias defe="sdcv --color -u dictd_www.dict.org_gcide"
alias defd="sdcv --color -u LDaF"
alias deff="sdcv --color -u XMLittre"
#goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

export LESS='--RAW-CONTROL-CHARS --ignore-case --hilite-search --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=2 '
export LESSOPEN='|~/scripts/lesscolor.sh %s'
export PYGMENTIZE_STYLE="paraiso-dark"
# libtrash settings
# export LD_PRELOAD=/usr/local/lib/libtrash.so.3.5
# alias trashon=”export TRASH_OFF=NO”
# alias trashoff=”export TRASH_OFF=YES”
export MYSQL_PS1="\U@\N:\p [\d] - \R:\m:\s - \v\n>>>"

# TZ=Asia/Tehran
# export TZ
export GPG_TTY=$(tty)

export PS_FORMAT=pid,start,etime,%cpu,%mem,lxc,cgroup,tty,wchan,exe,cmd

export VAGRANT_HOME="/home/devi/storage/ssd1/vagrant"

export BAT_THEME="Solarized (light)"

export SVDIR=~/service

export FZF_TMUX_OPTS="-p 70%,70% --border=sharp"
export FZF_DEFAULT_OPTS="--color fg:7,bg:0,hl:31,fg+:24,bg+:0,hl+:63,info:34,prompt:27,spinner:24,pointer:24,marker:22"

export YTFZF_HIST=1
export YTFZF_LOOP=0
# export YTFZF_PREF="bestvideo[height<=?1080]+bestaudio/best"
export YTFZF_PREF="22"
export YTFZF_ENABLE_FZF_DEFAULT_OPTS=1
export YTFZF_CACHE=~/.cache/ytfzf

export PERL5LIB=/home/devi/lib/perl5/share/perl5/site_perl

backup_home(){
  # wget https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes/master/rsync-homedir-excludes.txt -O /var/tmp/ignorelist
  sudo rsync -rxlPptgoDAXHvaE \
    --delete \
    --devices \
    --specials \
    --info=PROGRESS2,MOUNT2 \
    --exclude-from=/home/devi/scripts/rsync/ignorelist \
    --exclude="storage" \
    --exclude="sambashare" \
    /home/devi/ \
    /home/devi/storage \
    /home/devi/storage/backup/devi/ \
    "$@"
}

fixrc() {
  cp ~/scripts/.zshrc ~/.zshrc && exec zsh
}

fixtheme() {
  cp ~/scripts/devi.zsh-theme ~/.oh-my-zsh/themes/devi.zsh-theme && exec zsh
}

export PATH=$PATH:/home/devi/.cargo/bin
export PATH=$PATH:/home/devi/scripts/bin
export PATH=$PATH:/home/devi/.fzf/bin
# export PATH=$PATH:/home/devi/.ghcup/bin
export PATH=$PATH:/home/devi/k3s
export PATH=$PATH:/home/devi/kompose
export PATH=$PATH:/home/devi/powershell
export PATH=$PATH:/home/devi/ytfzf.git/v2.5.5.rc-5
export PATH=$PATH:/home/devi/gotty
export PATH=$PATH:/home/devi/.poetry/bin
export PATH=$PATH:/home/devi/pulumi
export PATH=$PATH:/home/devi/dry
export PATH=$PATH:/home/devi/.fnm
export PATH=$PATH:/home/devi/.rbenv/bin
export PATH=$PATH:/home/devi/k9s
export PATH=$PATH:/home/devi/opam
export PATH=$PATH:/home/devi/devi/ghorg
export PATH=$PATH:/home/devi/kubectl
export PATH=$PATH:/home/devi/solidity
# export PATH=$PATH:/home/devi/vagrant
# export PATH=$PATH:/home/devi/devi/emsdk.git/main
# export PATH=$PATH:/home/devi/devi/emsdk.git/main/node/14.15.5_64bit/bin
# export PATH=$PATH:/home/devi/devi/emsdk.git/main/upstream/emscripten
export PATH=$PATH:/home/devi/google-java-format
export PATH=$PATH:/home/devi/gradle/gradle-7.2/bin
# export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.8
# export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.8/node/14.18.2_64bit/bin
# export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.8/upstream/emscripten
export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.28
export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.28/node/14.18.2_64bit/bin
export PATH=$PATH:/home/devi/devi/emsdk.git/3.1.28/upstream/emscripten
export PATH=$PATH:/home/devi/devi/git-scripts.git/master
export PATH=$PATH:/home/devi/mongo_db_tools/mongodb-database-tools-ubuntu2004-x86_64-100.5.2/bin
# flatpaks
export PATH=$PATH:/var/lib/flatpak/exports/bin

ks() {
  grc kubectl -n kube-system "$@"
}

export EDITOR=vim
export BROWSER=w3m
export BUILDKIT_COLORS="run=green:warning=yellow:error=red:cancel=255,165,0"

dig() {
  globalholecounter=0
  local ABBATOIR_PATH="/home/devi/devi/abbatoir"
  if test "$("ls" -A ${ABBATOIR_PATH})"; then
    while [ 1 ]; do
      if [ -d "${ABBATOIR_PATH}/hole$globalholecounter" ]; then
        # if its not empty
        if test "$("ls" -A "${ABBATOIR_PATH}/hole$globalholecounter")"; then
          :
        # if its empty
        else
          cd ${ABBATOIR_PATH}/hole$globalholecounter
          break
        fi
      else
        mkdir ${ABBATOIR_PATH}/hole$globalholecounter
        cd ${ABBATOIR_PATH}/hole$globalholecounter
        echo $globalholecounter
        break
      fi
      ((globalholecounter++))
    done
  else
    mkdir ${ABBATOIR_PATH}
    mkdir ${ABBATOIR_PATH}/hole$globalholecounter
    cd ${ABBATOIR_PATH}/hole$globalholecounter
  fi
}

burrow() {
  globalholecounter=0
  local FLESH_PIT_PATH="/tmp/fleshpit"
  if test "$("ls" -A ${FLESH_PIT_PATH})"; then
    while [ 1 ]; do
      if [ -d "${FLESH_PIT_PATH}/pit$globalholecounter" ]; then
        # if its not empty
        if test "$("ls" -A "${FLESH_PIT_PATH}/pit$globalholecounter")"; then
          :
        # if its empty
        else
          cd ${FLESH_PIT_PATH}/pit$globalholecounter
          break
        fi
      else
        mkdir ${FLESH_PIT_PATH}/pit$globalholecounter
        cd ${FLESH_PIT_PATH}/pit$globalholecounter
        echo $globalholecounter
        break
      fi
      ((globalholecounter++))
    done
  else
    mkdir ${FLESH_PIT_PATH}
    mkdir ${FLESH_PIT_PATH}/pit$globalholecounter
    cd ${FLESH_PIT_PATH}/pit$globalholecounter
  fi
}

clearhalf() {
  clear
  local size=$(stty size|gawk '{print$1}')
  size=$(($size/2))
  tput cup $size 0 && tput ed
}
alias cleanhalf="clearhalf"
alias halfclear="clearhalf"
alias halfclean="clearhalf"
alias dighalf="dig && cleanhalf"

# function nn {
#   echo $1 >> ~/.devi/notes.txt
# }

# function nnshow {
#   cat ~/.devi/notes.txt
# }

# function nnedit {
#   vim ~/.devi/notes.txt
# }

# function nnpurge {
#   rm ~/.devi/notes.txt
# }

# function lxx {
# 	readable $1 | lynx -stdin
# }

bindkey -v
set blink-matching-paren on
export KEYTIMEOUT=1
export VIRTUAL_ENV_DISABLE_PROMPT=yes
export QT_QPA_PLATFORMTHEME=gtk2
# export APRIL_MODEL_PATH=/home/devi/devi/LiveCaptions/aprilv0_en-us.april
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/devi/devi/onnx_runtime/onnxruntime-linux-x64-1.13.1/lib
livecaptions() {
  meson devenv -C /home/devi/devi/LiveCaptions/builddir
  env \
    APRIL_MODEL_PATH=/home/devi/devi/LiveCaptions/aprilv0_en-us.april \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/devi/devi/onnx_runtime/onnxruntime-linux-x64-1.13.1/lib \
    /home/devi/devi/LiveCaptions/builddir/src/livecaptions
}

gen_rand_str() {
  tr -dc A-Za-z0-9 </dev/urandom | head -c "$1" ; echo ''
}

# fnm
eval "$(fnm env)"
# _evalcache fnm env

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
vman() {
  vim -R -M -c 'silent only' -c 'colo iceberg' -c 'highlight Normal ctermbg=None' -c 'highlight lineNr ctermbg=16' -c 'hi EndOfBuffer ctermbg=16' -c "Man $1 $2" +only
}

vinfo() {
  vim -R -M -c 'colo iceberg' -c 'highlight Normal ctermbg=None' -c 'highlight lineNr ctermbg=16' -c 'hi EndOfBuffer ctermbg=16' -c "Info $1 $2" +only
}

ddig() {
  if [[ "$2" == "" ]];then
    docker exec -it $(docker ps | grep "\b$1\b" | gawk '{print $1}') bash
  else
    docker exec -it $(docker ps | grep "\b$1\b" | gawk '{print $1}') $2
  fi
}

timezsh() {
  local shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# fd() {
#   preview="git diff $@ --color=always -- {-1}"
#   git diff $@ --name-only | fzf -m --ansi --preview $preview
# }


# https://unix.stackexchange.com/questions/81408/how-can-i-figure-out-which-ptys-are-from-which-qemu
list_virsh_ptys() {
  for i in `virsh list | awk '{print $2}' | egrep -v "^$|Name"`; do
    printf "%-14s:%s\n" $i $(virsh ttyconsole $i | grep -v "^$");
  done
}

pod2w3m() {
  pod2html $1 | w3m -T text/html
}

get_irssi_logs() {
  psql -h 192.168.1.109 -p 30432 -U postgres postgres -c '\c irc' -c 'select * from public.logs;'
}

virshxml() {
  virsh dumpxml --domain "$@" | pygmentize -l xml -P style=$PYGMENTIZE_STYLE | nl | less
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
setopt NO_BEEP
setopt INTERACTIVE_COMMENTS
setopt PROMPT_SUBST
# no more C-s and C-q
unsetopt FLOW_CONTROL
setopt LONG_LIST_JOBS
setopt +o nomatch
export HISTFILE=~/.zsh_history
setopt LIST_PACKED

# eval "$(goenv init -)"
# export PATH="$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"
export GOPROXY=https://goproxy.io

fzf_postit() {
  cat ~/scripts/postit | fzf-tmux -p 80%,80% -- --bind 'enter:execute(echo {} | xsel -ib)+accept' > /dev/null 2>&1
}

fzf_glyphs() {
  cat ~/scripts/glyphs/glyph_list | fzf-tmux -p 80%,80% -- --bind 'enter:execute(tmux set-buffer $(echo {}|cut -d- -f1))+accept' | cut -d- -f1 > /dev/null 2>&1
}

fzf_lclipd() {
  local clipboard_content=$(echo 'select * from lclipd;' | nc 127.0.0.1 9999 | jq '.[1]' | awk '{print substr($0, 2, length($0) - 2)}' | fzf-tmux -p 80%,80%)
  if [[ -n ${clipboard_content} ]]; then
    tmux set-buffer ${clipboard_content}
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# this should be here before the end
# bindkey ' ' autosuggest-accept
# bindkey -s '' 'fzf_postit'
zle -N fzf_postit
bindkey '' fzf_postit
zle -N fzf_glyphs
bindkey '' fzf_glyphs
zle -N fzf_lclipd
bindkey '' fzf_lclipd

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf-tmux -p 80%,80% -- --bind ctrl-/:toggle-preview "$@"
}

dff() {
  grc df --output -h
}

stone_backup() {
  proxychains4 -q -f ~/proxies/66/proxychains.conf scp -P 3333 -i /home/devi/.ssh/id_rsa_lv2 "$@" ubuntu@[2a07:e01:3:1c4::1]:/home/ubuntu/backup
}

jcurl() {
  curl --socks5 socks5h://127.0.0.1:9054 -s --connect-timeout 10 "$@" | json_pp -json_opt pretty,canonical | pygmentize -l json -P style=$PYGMENTIZE_STYLE | $PAGER
}
xcurl() {
  curl --socks5 socks5h://127.0.0.1:9054 -s --connect-timeout 10 "$@" | xml_pp -s nice | pygmentize -l xml -P style=$PYGMENTIZE_STYLE | $PAGER
}
hcurl() {
  curl --socks5 socks5h://127.0.0.1:9054 -s --connect-timeout 10 -i -D /dev/stderr --user-agent "$(get_random_ua.sh)" "$@" | pygmentize -l html -P style=$PYGMENTIZE_STYLE | $PAGER
}

# these i stole from junegunn to try out
fzf_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
  cut -c4- | sed 's/.* -> //'
}

fzf_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fzf_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
}

fzf_gm() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

fzf_gr() {
  is_in_git_repo || return
  git remote -v | gawk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d$'\t' -f1
}

fzf_gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
  cut -d: -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bindkey -r ""
# bindkey -r "^H"
bind-git-helper f b t r m s
unset -f bind-git-helper

fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

export COLORTERM=truecolor
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_so=$'\e[1;92m'        # begin standout-mode - info box
export LESS_TERMCAP_so=$'\x1b[48;5;22m\x1b[38;5;0m'
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline
# handle the format of the zsh built-in time
TIMEFMT="'$fg[green]%J$reset_color' time: $fg[blue]%*Es$reset_color, cpu: $fg[blue]%P$reset_color"

# using Q instead of q in range quits but also cds to where you last where in ranger
# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
ranger() {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# eval "$(rbenv init -)"
_evalcache rbenv init -
[ -f "/home/devi/.ghcup/env" ] && source "/home/devi/.ghcup/env" # ghcup-env

eval "$(luarocks-5.3 path)"

# enables the help builtin like bash's help builtin
unalias run-help
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help

# fucks up the path. thanks cpan.
# PATH="/home/devi/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/devi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/devi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/devi/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/devi/perl5"; export PERL_MM_OPT;

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
_evalcache pyenv init -
_evalcache pyenv virtualenv-init -
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# deno
export DENO_INSTALL="/home/devi/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export DVM_DIR="/home/devi/.dvm"
export PATH="$DVM_DIR/bin:$PATH"
export PATH=/home/devi/.bun/bin:$PATH
export XBPS_DISTDIR=/home/devi/void-packages.git/master

#plan9
# PLAN9=/home/devi/devi/plan9port.git/master export PLAN9
# PATH=$PATH:$PLAN9/bin export PATH

[[ -s "/home/devi/.gvm/scripts/gvm" ]] && source "/home/devi/.gvm/scripts/gvm"
# [[ -s "/usr/share/grc/grc.zsh" ]] && source /usr/share/grc/grc.zsh
export HISTSIZE=100000
export SAVEHIST=100000

# dogslow
# >>>> Vagrant command completion (start)
# fpath=(/usr/lib/vagrant/gems/vagrant-2.3.5/contrib/zsh $fpath)
# compinit
# <<<<  Vagrant command completion (end)

# source the theme
# source ~/scripts/devi.zsh-theme

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/devi/ssd1/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/devi/ssd1/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/devi/ssd1/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/devi/ssd1/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

