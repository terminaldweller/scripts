#!/usr/bin/env sh

kubectl apply -f ./pihole-secret.yaml
kubectl apply -f ./pihole-configmap.yaml
kubectl create configmap local-dns-file --from-file=10-customdns.conf
kubectl apply -f ./pihole-deployment.yaml
