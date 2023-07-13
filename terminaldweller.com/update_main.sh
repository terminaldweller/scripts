#!/usr/bin/env sh
set -ex

(cd ./main/srv/keys && \
  gpg2 --export --armor devi@terminaldweller.com > gpg_pubkey && \
  gpg2 --export --armor thabogre@gmail.com > gmail_gpg_pubkey && \
  gpg2 --export --armor bloodstalker@zoho.com > zoho_gpg_pubkey)

(cd ./main/srv/.well-known/openpgpkey/hu/ && \
  gpg2 --export devi@terminaldweller.com > gpg_pubkey.asc && \
  gpg2 --export thabogre@gmail.com > gpg_gmail.asc && \
  gpg2 --export bloodstalker@zoho.com > gpg_zoho.asc)

(cd ~/scripts/identicon && \
  poetry run ~/scripts/identicon/gen_blockie.py \
  --input ./main/srv/.well-known/openpgpkey/hu/gpg_pubkey.asc \
  --out ../terminaldweller.com/main/srv/identicon.png)
(cd ~/scripts/identicon && \
  poetry run ~/scripts/identicon/gen_blockie.py \
  --input ./main/srv/.well-known/openpgpkey/hu/gpg_gmail.asc \
  --out ../terminaldweller.com/main/srv/gmail.png)
(cd ~/scripts/identicon && \
  poetry run ~/scripts/identicon/gen_blockie.py \
  --input ./main/srv/.well-known/openpgpkey/hu/gpg_zoho.asc \
  --out ../terminaldweller.com/main/srv/zoho.png)
(cd ~/scripts/identicon && \
  poetry run ~/scripts/identicon/gen_blockie.py \
  --input ~/.ssh/id_rsa.pub \
  --out ../terminaldweller.com/main/srv/ssh_pub.png)

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

#ipfs
${PROXY} scp -4 -r -P 3333 ./main/srv/ ubuntu@89.147.110.30:/home/ubuntu/terminaldweller.com-ipfs/
${PROXY} ssh -p 3333 ubuntu@89.147.110.30 ipfs add -r ~/terminaldweller.com-ipfs/srv/
${PROXY} ssh -p 3333 ubuntu@89.147.110.30 ipfs pin add -r ${IPFS_ROOT_HASH}
