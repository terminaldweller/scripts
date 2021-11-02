#!/usr/bin/env sh

kubectl apply -f ./mongodb-secret.yaml
kubectl apply -f ./mongodb-configmap.yaml
kubectl apply -f ./mongodb-data-volume.yaml
kubectl create configmap mongodb-config-file --from-file=mongod.conf
kubectl apply -f ./mongodb-deployment.yaml

# kubectl delete pod mongodb
# kubectl delete pvc
# kubectl delete pv
