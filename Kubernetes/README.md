# pod
edit a pod :
```bash 
#dec is the name of Pod
kubectl edit po dec
```
enter pod:
```bash
kubectl exec -it dec -- /bin/bash
```
get the image name by describe:
```bash 
kubectl describe pod dec | grep image
```