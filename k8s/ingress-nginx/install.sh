#!/bin/bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

NAMESPACE=${1:-"ingress-nginx"}

[[ $(kubectl get ns | grep $NAMESPACE | wc -l) -eq "0" ]] && kubectl create ns $NAMESPACE

helm install ingress-nginx ingress-nginx/ingress-nginx -n $NAMESPACE
