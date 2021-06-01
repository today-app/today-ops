#!/bin/bash

helm repo add kong https://charts.konghq.com
helm repo update

NAMESPACE=${1:-"kong"}

[[ $(kubectl get ns | grep $NAMESPACE | wc -l) -eq "0" ]] && kubectl create ns $NAMESPACE

helm install kong kong/kong --set ingressController.installCRDs=false -n $NAMESPACE
