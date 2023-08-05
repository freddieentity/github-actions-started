#!/bin/bash 
# kube-bench.sh

echo "|x| Performing AQUA Security Kube-bench Scanning..."
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: kube-bench
spec:
  template:
    spec:
      hostPID: true
      containers:
        - name: kube-bench
          image: docker.io/aquasec/kube-bench:latest
          command:
            ["kube-bench", "run", "--targets", "master,node,etcd,policies", "--benchmark", "cis-1.20"]
          volumeMounts:
            - name: var-lib-kubelet
              mountPath: /var/lib/kubelet
              readOnly: true
            - name: etc-systemd
              mountPath: /etc/systemd
              readOnly: true
            - name: etc-default
              mountPath: /etc/default
              readOnly: true
            - name: etc-kubernetes
              mountPath: /etc/kubernetes
              readOnly: true
      restartPolicy: Never
      volumes:
        - name: var-lib-kubelet
          hostPath:
            path: "/var/lib/kubelet"
        - name: etc-systemd
          hostPath:
            path: "/etc/systemd"
        - name: etc-default
          hostPath:
            path: "/etc/default"
        - name: etc-kubernetes
          hostPath:
            path: "/etc/kubernetes" 
EOF
kubectl wait --for=condition=complete --timeout=180s job/kube-bench
kubectl logs job/kube-bench
kubectl delete job/kube-bench
