#!/bin/bash 
# kubesec.sh

echo "|x| Performing Kubesec Scanning..."
# kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job-aks.yaml 
# kubectl wait --for=condition=complete --timeout=180s job/kube-bench
# kubectl logs job/kube-bench
# kubectl delete job/kube-bench