#!/bin/sh

kubectl apply -f ./vaultwarden-data-volume.yaml
kubectl apply -f ./vaultwarden-deployment.yaml
