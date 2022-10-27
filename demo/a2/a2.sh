# 2.1 deploy local cluster
#create local cluster
kind create cluster --name kind-1 --config ../../k8s/kind/cluster-config.yaml
# list the running container
docker ps
# cluster details
kubectl cluster-info
# nodes status check
kubectl get nodes

# 2.2.1 deploy task A1.1 docker images as deployment
# deploy deployment
kubectl apply -f ../../k8s/manifests/k8s/backend-deployment.yaml 
# wait until the deployment to finish setting up
kubectl wait --for=condition=ready pod --selector=app=backend --timeout=60s
# list the deployment created
kubectl get deployments
# list of the pod in replica
kubectl get pod 


# 2.2.2 Create service 
# deploy service
kubectl apply -f ../../k8s/manifests/k8s/backend-service.yaml
# list of service created
kubectl get service
# get the details of the service
kubectl describe service backend
# list more information on the pod to check if the ip address matching with the service service
kubectl get pod -o wide

# 2.3.1 Create ingress-controller
# install nginx-ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
# wait for the ingress controller pod to be up, running, and ready
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=60s
# list all the pod with namespace ingress-nginx
kubectl -n ingress-nginx get deploy

# 2.3.2 Create ingress
kubectl apply -f ../../k8s/manifests/k8s/backend-ingress.yaml
# wait until the ingress to finish setting up
kubectl wait --for=condition=ready pod --selector=app=backend --timeout=60s
# list of ingress created
kubectl get ingress
