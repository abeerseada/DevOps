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
Get pods in a specific lable (env=prod)
```bash
kubectl get pods --selector env=prod
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
Change the default namespace to the specified namespace 
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
### apiVersion= apps/v1 

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
---
# Deployment
### apiVersion= apps/v1 
*A deployment is a higher abstraction that manages one or more ReplicaSets.*
*Scaling up and down of the application.*  
*Roll out and Rollback.*  
*No downtime when deploying the newer version of the application.*  
*Different strategies of deployment.* 

**!!!!!! Exam tip !!!!!**
*Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)* 

```bash 
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml
```
Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run) and save it to a file.

```bash
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml
```
Create a Service named nginx of type NodePort to expose pod nginx's port 80 on port 30080 on the nodes:
```bash
kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml
```

Create a new Deployment
```bash 
kubectl create deployment ‹deploy-name> --image=nginx --replicas=3
```
List all Deployments
```bash
kubectl get deployment
```
Get more informatlon about the specified Deployment
```bash
kubectl describe deployment <deployment-name>
```
Delete the specified Deployment
```bash
kubectl delete deployment <deployment-name>
```
---
# Services
### apiVersion= v1 
*an abstract way to expose an applicatlon running on a set of Pods as a network service to other applications or to the external world.*
*A service groups a set of pods together and makes them accessible.*  
*Services in Kubernetes aim to solve connectivity issues.*  
*K8s services have fixed IP addresses.*  
*IP Address assignments to a K8s service can happen dynamically (by K8s) or statically.*  
*K8s services match pods using Labels and Selectors.*  
Create a service for a deployment
```bash 
kubectl expose deployment < deploy-name> --port=5000 --target-port=80
```
Get more information about the specified Services
```bash 
kubectl describe svc <svc-name>
```
Deletes the specified Services
```bash
kubectl delete svc ‹svc-name>
```
---
# Taint and Tolerations
Taint:
```bash 
kubectl taint nodes node1 key=value:taint-effect
```
taint-effect:NoSchedule,PreferNoSchedule,NoExecute
to remove a taint :
```bash 
kubectl taint nodes node1 key=value:taint-effect-
```
Toleration:
*added to spec section!*
```yaml
tolerations:
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
```
---
# NodeSelectors
```bash
kubectl label nodes <node-name> <lable-key>=<lable-value>
```
add a nodeSelector to a pod (*spec section*):
```yaml
nodeSelector:
    key: value
```    
---
# Node Affinity
```yaml
affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: color
                    operator: In
                    values:
                      - blue
```
types :requiredDuringSchedulingIgnoredDuringExecution,preferredDuringSchedulingIgnoredDuringExecution
ex:
```yaml
affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchLabels:
            color: blue
```            
---
# Resources
```yaml
resources:
            requests:
              memory: "64Mi"
              cpu: "250m"
            limits:
              memory: "128Mi"
              cpu: "500m"
          imagePullPolicy: Always
```
| Item              | **ResourceQuota**                                       | **LimitRange**                                              |
|-------------------|---------------------------------------------------------|-------------------------------------------------------------|
| **Scope**         | Applied at the **namespace** level                      | Applied at the **container** level within the **pod**        |
| **Purpose**       | Defines maximum resource usage across all objects in a **namespace**. | Defines the minimum and maximum resources for each **container**. |
| **Resources**     | Can define total limits for **pods**, **services**, as well as **CPU** and **Memory**. | Defines **requests** and **limits** for **CPU** and **Memory** at the container level. |
| **Scope of Impact** | Affects all objects within the **namespace**.           | Affects only **containers** within **pods**.                 |

