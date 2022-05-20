#!/usr/bin/bash

# make_jail $EXE_PATH $JAIL_PATH $JAIL_USER
LIBS=$(ldd "$1" | grep -v vdso | awk '{print $3}')

mkdir "$2"
for LIB in $LIBS; do
  mkdir -p $2/$(dirname $LIB) && cp $LIB $2/$(dirname $LIB)
done

# copy over libs for needed for network functionality
mkdir -p $2/lib
cp /lib/libnss* $2/lib/
cp /lib/libnsl* $2/lib/
cp /lib/libresolv* $2/lib/

mkdir -p $2/etc
cp /etc/hosts $2/etc/
cp /etc/host.conf $2/etc/
cp /etc/resolv.conf $2/etc/
cp /etc/nsswitch.conf $2/etc/
sudo chattr +i $2/etc/hosts
sudo chattr +i $2/etc/host.conf
sudo chattr +i $2/etc/resolv.conf
sudo chattr +i $2/etc/nsswitch.conf

mkdir -p $2/dev
sudo mknod -m 644 $2/dev/null c 1 3
sudo mknod -m 644 $2/dev/random c 1 8
sudo mknod -m 644 $2/dev/urandom c 1 9

mkdir -p $2/usr/share/
sudo cp -r /usr/share/perl5 $2/usr/share/

mkdir -p $2/home/jailor_irssi/.irssi
mkdir -p $2/home/jailor_irssi/.irssi/scripts/autorun
sudo chown $3:$3 $2/home/jailor_irssi

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
mv *.pl $2/home/$3/.irssi/scripts/autorun/

cd ~/scripts/irssi
cp ./config ~/.irssi/config
cp ./solarized-powerline.theme ~/.irssi/solarized-powerline.theme
cp ./startup ~/.irssi/startup
