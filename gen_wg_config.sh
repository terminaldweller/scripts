#!/bin/sh
# before running this switch to sudo i.e., sudo -i or su -
set -x
set -e

CONFIG_CONTENT="[Interface]\n
Address = 10.10.0.<RAND_ADDRESS>/32\n
Address = fd86:ea04:1111::<RAND_ADDRESS>/128\n
PrivateKey = <CLIENT_PRIV_KEY>\n
DNS = 1.1.1.1\n
\n
[Peer]\n
PublicKey = SERVERPUBKEY\n
Endpoint = <PUB_IP_ADDRESS>:51820\n
AllowedIPs = 0.0.0.0/0, ::/0"

CONFIG_FILE_DIR=~/config
mkdir -p $CONFIG_FILE_DIR
RAND_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

RAND_ADDRESS=$(shuf -i 1-255 -n 1)

OWNER=$(echo $USER)

TMPDIR=$(mktemp -d)
cd $TMPDIR
wg genkey | sudo tee privatekey"$RAND_NAME" | wg pubkey | sudo tee publickey"$RAND_NAME"

SERVER_PUB_KEY=$(cat /etc/wireguard/publickey)
CLIENT_PRIV_KEY=$(cat privatekey"$RAND_NAME")
PUB_IP_ADDRESS=$(curl ipinfo.io/ip)

OUTPUT=$(echo $CONFIG_CONTENT | sed "s%SERVERPUBKEY%$SERVER_PUB_KEY%")
OUTPUT=$(echo $OUTPUT | sed "s%<CLIENT_PRIV_KEY>%$CLIENT_PRIV_KEY%")
OUTPUT=$(echo $OUTPUT | sed "s/<PUB_IP_ADDRESS>/$PUB_IP_ADDRESS/")
OUTPUT=$(echo $OUTPUT | sed "s/<RAND_ADDRESS>/$RAND_ADDRESS/g")

cd $CONFIG_FILE_DIR
echo $OUTPUT > wg"$RAND_NAME".conf
chmod 600 wg"$RAND_NAME".conf
chown $USER:$USER wg"$RAND_NAME".conf

CLIENT_PUB_KEY=$(cat $TMPDIR/publickey"$RAND_NAME")
wg set wg0 peer $CLIENT_PUB_KEY allowed-ips 10.10.0."$RAND_ADDRESS"/32,fd86:ea04:1111::"$RAND_ADDRESS"/128
rm -rf $TEMPDIR
