#!/usr/bin/env sh

kubectl apply -f ./pihole-secret.yaml
kubectl apply -f ./pihole-configmap.yaml
kubectl apply -f ./pihole-deployment.yaml
