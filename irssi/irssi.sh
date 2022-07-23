#!/usr/bin/env sh

mkdir -p ~/.irssi/scripts/autorun
cd ~/.irssi/scripts/autorun
wget https://scripts.irssi.org/scripts/adv_windowlist.pl
wget https://scripts.irssi.org/scripts/dccstat.pl
wget https://scripts.irssi.org/scripts/desktop_notify.pl
wget https://raw.githubusercontent.com/terminaldweller/irssi-scripts/master/vim-mode/vim_mode.pl
wget https://raw.githubusercontent.com/terminaldweller/irssi-scripts/master/irssi-logger/irssi_logger.pl
wget https://raw.githubusercontent.com/terminaldweller/irssi-scripts/master/hilite-url/hilite_url.pl
wget https://scripts.irssi.org/scripts/line_buffer.pl
wget https://scripts.irssi.org/scripts/messages_bottom.pl
wget https://scripts.irssi.org/scripts/nm2.pl
wget https://scripts.irssi.org/scripts/rotator.pl
wget https://scripts.irssi.org/scripts/savecmdhist.pl
wget https://scripts.irssi.org/scripts/sbposition.pl
wget https://scripts.irssi.org/scripts/sb_search.pl
wget https://scripts.irssi.org/scripts/scriptassist.pl
wget https://scripts.irssi.org/scripts/seen.pl
wget https://scripts.irssi.org/scripts/timezones.pl
wget https://scripts.irssi.org/scripts/trackbar.pl
wget https://scripts.irssi.org/scripts/uberprompt.pl
wget https://scripts.irssi.org/scripts/usercount.pl
wget https://scripts.irssi.org/scripts/tracknick.pl
wget https://scripts.irssi.org/scripts/cmdind.pl
wget https://scripts.irssi.org/scripts/settingshelp.pl

cd ~/scripts/irssi
cp ./config ~/.irssi/config
cp ./solarized-powerline.theme ~/.irssi/solarized-powerline.theme
cp ./startup ~/.irssi/startup
