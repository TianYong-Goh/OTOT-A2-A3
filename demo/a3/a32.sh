# create deploymentt wie=th topologySpread Constraint
kubectl apply -f ../../k8s/manifests/k8s/backend-deployment-zone-aware.yaml
# to chek the worker in each zones
kubectl get nodes -L topology.kubernetes.io/zone
# to check the number pod distribute to each workers. Each zones should have (totalpod/2) +or- 1 pods
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName' -w