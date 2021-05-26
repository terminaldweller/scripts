#!/bin/sh
set -x
set -e

cd ~ && git clone https://github.com/tats/w3m && cd w3m && ./configure --with-ssl --with-imagelib=imlib2 --with-termlib=terminfo && sudo make install -j4
