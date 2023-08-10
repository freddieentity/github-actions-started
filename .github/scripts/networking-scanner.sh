#!/bin/bash 
# kube-bench.sh

echo "|x| Performing Network Scanning..."

echo "|o| SSL/TLS Scanning..."
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: testssl
spec:
  completions: 1
  parallelism: 1
  backoffLimit: 3
  template:
    spec:
      hostPID: true
      containers:
        - name: testssl
          image: docker.io/drwetter/testssl.sh
          command:
          - /bin/sh
          - -c
          - |
            testssl.sh https://example.com
      restartPolicy: Never
EOF
kubectl wait --for=condition=complete --timeout=360s job/testssl
kubectl logs job/testssl
kubectl delete job/testssl

echo "|o| SSL/TLS Scanning Finished..."

echo "|o| Port Scanning..."
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: nmap
spec:
  completions: 1
  parallelism: 1
  backoffLimit: 3
  template:
    spec:
      hostPID: true
      containers:
        - name: nmap
          image: docker.io/drwetter/nmap.sh
          command:
          - /bin/sh
          - -c
          - |
            nmap https://example.com
      restartPolicy: Never
EOF
kubectl wait --for=condition=complete --timeout=360s job/nmap
kubectl logs job/nmap
kubectl delete job/nmap