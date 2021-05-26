#!/usr/bin/env sh

VIM_VERSION=8.2.2885

sudo apt remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim /usr/bin/vim
sudo apt-get install -y liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

mkdir -p ~/vimsrc && \
  cd ~/vimsrc && \
  wget https://github.com/vim/vim/archive/v"$VIM_VERSION".tar.gz && \
  tar -xvf v"$VIM_VERSION".tar.gz -C ~/vimsrc

cd vim-"$VIM_VERSION" && ./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-perlinterp=yes \
  --enable-rubyinterp=yes \
  --with-ruby-command=/usr/bin/ruby \
  --enable-luainterp=yes \
  --with-luajit \
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.8/config-3.8m-x86_64-linux-gnu \
  --with-python3-command=python3 \
  --enable-cscope \
  --enable-gui=auto \
  --with-features=huge \
  --with-x \
  --enable-fontset \
  --enable-largefile \
  --disable-netbeans \
  --prefix=/usr/local \
  --enable-terminal \
  --with-compiledby="farzadsadeghi <thabogre@gmail.com>" \
  --enable-fail-if-missing
# --enable-pythoninterp=yes \
# --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \

make -j4 && sudo make install
# run :helptags path-to-where-the-docs-are
sudo vim -c "helptags $VIMRUNRIME"
