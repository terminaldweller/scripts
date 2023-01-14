#!/bin/sh

/dnsproxy/dnsproxy \
  --tls-cert /certs/fullchain1.pem \
  --tls-key /certs/privkey1.pem \
  -l 0.0.0.0 \
  -p 0 \
  --https-port 8844 \
  --tls-port 8845 \
  --quic-port 8846 \
  --dnscrypt-port 8847 \
  -u sdns://AgcAAAAAAAAABzEuMC4wLjGgENk8mGSlIfMGXMOlIlCcKvq7AVgcrZxtjon911-ep0cg63Ul-I8NlFj4GplQGb_TTLiczclX57DvMV8Q-JdjgRgSZG5zLmNsb3VkZmxhcmUuY29tCi9kbnMtcXVlcnk \
  -u sdns://AQIAAAAAAAAAFDE3Ni4xMDMuMTMwLjEzMDo1NDQzINErR_JS3PLCu_iZEIbq95zkSV2LFsigxDIuUso_OQhzIjIuZG5zY3J5cHQuZGVmYXVsdC5uczEuYWRndWFyZC5jb20 \
  -u tls://dns.adguard.com \
  -u https://dns.adguard.com/dns-query \
  -u quic://dns.adguard.com \
  -b 1.1.1.1:53 \
  -b 9.9.9.9:53 \
  --http3 \
  -f 1.1.1.1:53 \
  -f 9.9.9.9:53 \
  --ratelimit 15 \
  --refuse-any \
  --cache \
  --cache-size 1048576 \
  --cache-min-ttl 900 \
  --cache-max-ttl 14400 \
  --cache-optimistic \
  --tls-min-version 1.3 \
  --tls-max-version 1.3
