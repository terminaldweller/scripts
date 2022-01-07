#!/usr/bin/env sh

kubectl create configmap squid-config-file --from-file=squid.conf
kubectl apply -f ./squid-proxy-deployment.yaml
