#!bin/sh

kubectl --namespace kube-system delete serviceaccount tiller
kubectl --namespace kube-system create serviceaccount tiller
kubectl delete clusterrolebinding tiller-cluster-rule
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl --namespace kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --upgrade
helm list
helm repo update
