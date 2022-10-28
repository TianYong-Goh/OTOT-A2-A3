# 3.1
# install matrix server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# disable certificate validation
kubectl -nkube-system edit deploy/metrics-server
# restart deployment
kubectl -nkube-system rollout restart deploy/metrics-server
# list pods to check the matrix server is running
kubectl -n kube-system get pods


# create HPA auto scaling
kubectl apply -f ../../k8s/manifests/k8s/backend-hpa.yaml
# check hpa event log
kubectl describe hpa
# check the number of pod
kubectl get hpa -w # and spam the webside using spam.sh and investigate the changes in number of replica.
# Alternatively:
# kubectl get pod
# spam the website(using spam.sh) or manually and check the number of pod again
## kubectl get pod
