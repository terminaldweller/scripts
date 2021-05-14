#!/bin/bash

DISTRO=$(sudo cat /etc/*-release | grep "\<NAME")
if [ $DISTRO = *"Fedora"* ]; then
  PCKMG="dnf install -y"
elif [ $DISTRO = *"Cent"* ]; then
  PCKMG="yum install -y"
elif [ $DISTRO = *"Ubuntu"* ]; then
  PCKMG="apt install -y"
elif [ $DISTRO = *"Debian"* ]; then
  PCKMG="apt install -y"
elif [ $DISTRO = *"Alpine"* ]; then
  PCKMG="apk add"
fi
PCKMG="apt install -y"

#get some bare essentials
sudo $PCKMG make cmake gcc gdb python3 vim lynx tmux zsh curl wget ksh ctags

#copy dot files
cp .tmux.conf ~/
cp .vimrc ~/

#setup hole diggin'
if [ ! -d "$HOME/abbatoir" ]; then
  mkdir $HOME/abbatoir
fi

#vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~/
#autojump
(cd ~; git clone https://github.com/wting/autojump)
(cd ~/autojump; ./install.py)
echo "#autojump" >> ~/.zshrc
(cd ~; echo "[[ -s $(pwd)/.autojump/etc/profile.d/autojump.sh ]] && source $(pwd)/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc)
echo "autoload -U compinit && compinit -u" >> ~/.zshrc

#zsh-syntax-highlighting
(cd ~/.oh-my-zsh/plugins; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting)
