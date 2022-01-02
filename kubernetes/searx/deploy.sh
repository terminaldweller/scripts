#!/usr/bin/env sh

kubectl apply -f ./searx-configmap.yaml
kubectl apply -f ./searx-deployment.yaml

# kubectl delete pod mongodb
# kubectl delete pvc
# kubectl delete pv
