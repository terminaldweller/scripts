#!/bin/sh
set -ex

cat_cert() {
  dir="/etc/letsencrypt/live/$1"
  cat "$dir/privkey.pem" "$dir/fullchain.pem" > "/certs/$1.pem"
}

while :;do
  echo starting...
  if [ -e /certs/$DOMAIN.pem ]; then
      certbot \
      certonly \
      --test-cert \
      --webroot -w /webroot \
      -d $DOMAIN \
      --email $EMAIL \
      --non-interactive \
      --agree-tos

    cat_cert $DOMAIN
  else
    certbot renew -w /webroot

    for dir in /etc/letsencrypt/live/*/; do
      cat_cert $(basename "$dir")
    done
  fi
  sleep 12h
done
