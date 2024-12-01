# pod
### apiVersion= v1
Edit a Pod :
```bash 
#dec is the name of Pod
kubectl edit po dec
```
Enter Pod:
```bash
kubectl exec -it dec -- /bin/bash
```
Get the image name by describe:
```bash 
kubectl describe pod dec | grep image
```
Delete all Pods:
```bash
kubectl delete pods --all
```
Get Pods:
```bash 
kubectl get pods -o wide
#wide is for more details 
```
Start a new Pod in the specified namespace:
```bash 
#Imperative 
kubectl run <pod-name> --image=<image-name> -n <namespace-name>
```
Get pods in a specific namespace:
```bash 
kubectl get pods -n <ns-name>
```
---
# Namespaces
### apiVersion= v1

### kubernetes intial (default) Namespaces:
1- default: the namespace where your resources are created in the beginning if you do not specify any namespace while creating your cluster.
2- kube-system: 
3- kube-public
4- kube-node-lease

Create new namespace:
```bash 
#ns or namespace
kubectl create ns <ns-name>
```
Get pod on specific namespace:
```bash
kubectl get pods --namespace=<ns-name>
```
Apply namespace.yml
```bash 
 kubectl apply -f Kubernetes/namespace.yml 
```
Delete namespace:
```bash
kubectl delete namespace <ns-name>
```
Describe namespace:
```bash 
kubectl describe namespace <ns-name>
```
Changes the default namespace to the specified namespace: 
```bash 
kubectl config set-context --current --namespace=<ns-name>
```
