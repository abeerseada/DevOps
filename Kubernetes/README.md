# pod
### apiVersion= v1
Edit a Pod 
```bash 
#dec is the name of Pod
kubectl edit po dec
```
Enter Pod
```bash
kubectl exec -it dec -- /bin/bash
```
Get the image name by describe
```bash 
kubectl describe pod dec | grep image
```
Delete all Pods
```bash
kubectl delete pods --all
```
Get Pods
```bash 
kubectl get pods -o wide
#wide is for more details 
```
Start a new Pod in the specified namespace
```bash 
#Imperative 
kubectl run <pod-name> --image=<image-name> -n <namespace-name>
```
Get pods in a specific namespace
```bash 
kubectl get pods -n <ns-name>
```
---
# Namespaces
### apiVersion= v1

### kubernetes intial (default) Namespaces
**1- default**: the namespace where your resources are created in the beginning if you do not specify any namespace while creating your cluster.  
**2- kube-system**   
**3- kube-public**  
**4- kube-node-lease**  

Create new namespace
```bash 
#ns or namespace
kubectl create ns <ns-name>
```
Get pod on specific namespace
```bash
kubectl get pods --namespace=<ns-name>
```
Apply namespace.yml
```bash 
 kubectl apply -f Kubernetes/namespace.yml 
```
Delete namespace
```bash
kubectl delete namespace <ns-name>
```
Describe namespace
```bash 
kubectl describe namespace <ns-name>
```
`Changes the default namespace to the specified namespace `
```bash 
kubectl config set-context --current --namespace=<ns-name>
```
Get configmap in a ns kube-public
```bash 
#cm is for ConfigMap
kubectl get cm -n kube-public
```
---
# ReplicaSets
### apiVersion= v1 

## Why Do We Need Kubernetes Replication? 
• In simple terms, the ReplicaSets(rs) or Replication Controller(rc) is used to run multiple instances of a single Pod to achieve load balancing and high availability.  
• This can be configured by simply mentioning the replicas count in the YAML file.  
• By monitoring the Pod status, if any Pod dies, the controller in effect will create a new (replacement)  

# Difference Between The Replication Controller and ReplicaSets
The `Replication controller` is **older**, it is replaced with the **newer** version which is `the ReplicaSets`.

Get the ReplicaSets
```bash
kubectl get rs 
```
Scales the specified ReplicaSet to 5
```bash
kubectl scale rs <rs-name> --replicas=5
```
Show labels
```bash 
kubectl get pods --show-labels
```
**Explain**
```bash 
kubectl explain <>
```
Add labels to a Pod
```bash 
kubectl lable pods <pod-name> <lable>
```
Remove labels to a Pod
```bash 
kubectl lable pods <pod-name> <lable>-
```
# Deployment