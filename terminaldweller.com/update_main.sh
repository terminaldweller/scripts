#!/usr/bin/env sh
set -ex

# PROXY="proxychains4 -q -f ~/proxies/ice/proxychains.conf"
PROXY=""

# GPG
gpg2 --export --armor devi@terminaldweller.com > gpg_pubkey
gpg2 --export devi@terminaldweller.com > gpg_pubkey.asc
mv ./gpg_pubkey ./main/srv/keys/
mv ./gpg_pubkey.asc ./main/srv/.well-known/openpgpkey/hu/

gpg2 --export --armor thabogre@gmail.com > gmail_gpg_pubkey
mv ./gmail_gpg_pubkey ./main/srv/keys/

gpg2 --export --armor bloodstalker@zoho.com > zoho_gpg_pubkey
mv ./zoho_gpg_pubkey ./main/srv/keys/

# main
#lokinet
${PROXY} scp -r -P 3333 ./main/srv/ ubuntu@185.130.45.46:/home/ubuntu/snapp/
#yggdrasil
${PROXY} scp -r -P 3333 ./main/srv/ ubuntu@185.130.47.208:/home/ubuntu/snapp/
#web2/tor/i2p
${PROXY} scp -r -P 3333 ./main/srv/ ubuntu@185.130.47.208:/home/ubuntu/terminaldweller.com/
#gopher
pandoc --from html --to plain --reference-links --reference-location=block --columns=70 -o ./index.txt ./main/srv/index.html
${PROXY} scp -P 3333 ./index.txt ubuntu@185.130.47.81:/home/ubuntu/gophers/
rm ./index.txt
#gemini
~/devi/html2gmi.git/master/html2gmi -m -t -l 1000 -i ~/scripts/terminaldweller.com/main/srv/index.html > index.gmi
${PROXY} scp -4 -P 3333 ./index.gmi ubuntu@jump8.terminaldweller.com:/home/ubuntu/gemini/srv/
rm ./index.gmi
