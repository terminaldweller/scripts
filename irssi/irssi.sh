#!/usr/bin/env sh

mkdir -p ~/.irssi/scripts/autorun
cd ~/.irssi/scripts/autorun
wget https://scripts.irssi.org/scripts/nickcolor.pl
wget https://scripts.irssi.org/scripts/adv_windowlist.pl
wget https://scripts.irssi.org/scripts/timezones.pl
wget https://scripts.irssi.org/scripts/seen.pl
wget https://scripts.irssi.org/scripts/colorize_nicks.pl
wget https://scripts.irssi.org/scripts/cubes.pl
wget https://scripts.irssi.org/scripts/dim_nicks.pl
wget https://scripts.irssi.org/scripts/hilite_url.pl
wget https://scripts.irssi.org/scripts/messages_bottom.pl
wget https://scripts.irssi.org/scripts/nm2.pl
wget https://scripts.irssi.org/scripts/savecmdhist.pl
wget https://scripts.irssi.org/scripts/sb_position.pl
wget https://scripts.irssi.org/scripts/trackbar.pl
wget https://scripts.irssi.org/scripts/scriptassist.pl
wget https://scripts.irssi.org/scripts/tordetect.pl
wget https://scripts.irssi.org/scripts/timezones.pl
wget https://scripts.irssi.org/scripts/usercount.pl
# wget https://scripts.irssi.org/scripts/bitlbee_typing_notice.pl
# wget https://scripts.irssi.org/scripts/uberprompt.pl
wget https://scripts.irssi.org/scripts/bitlbee_tab_completion.pl

cp ./config ~/.irssi/config
cp ./solarized-powerline.theme ~/.irssi/solarized-powerline.theme
cp ./startup ~/.irssi/startup
