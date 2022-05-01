#!/usr/bin/env sh

kubectl apply -f ./postgres-secret.yaml
kubectl apply -f ./postgres-data-volume.yaml
kubectl apply -f ./postgres-deployment.yaml

# kubectl delete pod mongodb
# kubectl delete pvc
# kubectl delete pv
