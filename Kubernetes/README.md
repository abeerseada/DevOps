# pod
edit a Pod :
```bash 
#dec is the name of Pod
kubectl edit po dec
```
enter Pod:
```bash
kubectl exec -it dec -- /bin/bash
```
get the image name by describe:
```bash 
kubectl describe pod dec | grep image
```
delete all Pods:
```bash
kubectl delete pods --all
```
get Pods:
```bash 
kubectl get pods -o wide
#wide is for more details 
```
---
# Namespaces
