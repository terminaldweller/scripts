#!/bin/sh
set -x
set -e

cd ~ && git clone https://github.com/tats/w3m && cd w3m && ./configure --with-ssl && sudo make install -j4
