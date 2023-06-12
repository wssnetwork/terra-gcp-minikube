#!/usr/bin/env bash

# Init minikube
sudo su ubuntu
minikube start --driver=docker

# Install HELM
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install OPA Gatekeeper
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user ubuntu
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml

# Install kubearmor
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install