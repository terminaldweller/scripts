#!/usr/bin/env sh

kubectl create configmap ntp-config --from-file=ntp.conf
kubectl apply -f ./openntpd-deployment.yaml
