#!/usr/bin/env sh

kubectl create configmap bitlbee-config-file --from-file=bitlbee.conf
kubectl apply -f ./bitlbee-data-volume.yaml
kubectl apply -f ./bitlbee-deployment.yaml

# kubectl delete pod mongodb
# kubectl delete pvc
# kubectl delete pv
