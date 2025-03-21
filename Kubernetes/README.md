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
# pod binding

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  nodeSelector:
    disktype: ssd
  containers:
    - name: nginx
      image: nginx

```

`pod-bind-definition.yaml`
```yaml
apiVersion: v1
kind: Binding
metadata:
  name: my-pod
target:
  apiVersion: v1
  kind: Node
  name: node-1  
```
---
# Taint and Tolerations
Taints and Tolerations allow you to control which pods can be scheduled on a node by restricting placement.  

Taint:
A taint is applied to a node to repel pods that do not have a matching toleration  
```bash 
kubectl taint nodes node1 key=value:taint-effect
```
taint-effect:NoSchedule,PreferNoSchedule,NoExecute  
`NoSchedule` → Pods without toleration won’t be scheduled.  
`PreferNoSchedule` → Tries to avoid scheduling but not enforced.  
`NoExecute` → Evicts running pods that don’t have toleration.  

✅ Example: Taint node node01 to prevent scheduling unless tolerated:

```sh
kubectl taint nodes node01 mykey=myvalue:NoSchedule
```
to remove a taint :
```bash 
kubectl taint nodes node1 key=value:taint-effect-
```
Toleration:
A toleration allows a pod to be scheduled on a tainted node.  
*added to spec section!*  
```yaml
tolerations:
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
```
```bash
apiVersion: v1
kind: Pod
metadata:
  name: tolerant-pod
spec:
  tolerations:
    - key: "mykey"
      operator: "Equal"
      value: "myvalue"
      effect: "NoSchedule"
  containers:
    - name: nginx
      image: nginx
```
✅ Now, tolerant-pod can be scheduled on node01 even though it has a taint.  

🔥 When to Use Taints & Tolerations?
`✅ Dedicated Nodes `→ Keep specific workloads on certain nodes
`✅ Critical Workloads` → Ensure only certain pods run on important nodes
`✅ Isolating Resources` → Prevent regular workloads from interfering with system-critical components
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

---
# Scheduler
Deploy Additional Scheduler as A Pod:-  
- frist create a config file :
```yaml
apiVersion: kubescheduler.config.k8s.io/v1
kind: KubeSchedulerConfiguration
profiles:
  - schedulerName: my-scheduler
  leaderElecation:
    leaderElect: true
    reasourceNamespace: kube-system 
    reasourceName: lock-object-my-scheduler
```
- then create a pod definition file:
```yaml 
apiVersion: v1
kind: Pod
metadata:
  name: my-custom-scheduler
  namespace: kube-system
spec:
  containers:
    - command:
      - kube-scheduler
      - --address=127.0.0.1
      - --kubeconfig=/etc/kubernetes/scheduler.conf #the path to the config file
      - --config=/etc/kubernetes/my-custom-scheduler.yaml
      - --leader-elect=true
      image: k8s.gcr.io/kube-scheduler-amd64:v1.11.3
      name: kube-scheduler
      - --scheduler-name=my-custom-scheduler
      - --lock-object-name=my-custom-scheduler
```
Deploy Additional Scheduler:
```bash
wget https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kube-scheduler
``` 
[https://kubernetes.io/docs/tasks/extend-kubernetes/configure-multiple-schedulers/] (Documentation)

View Schedulers:
```bash
kubectl get pods --namespace=kube-system
```
Use Custom Scheduler in a pod:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - image: nginx
      name: nginx
  schedulerName: my-custom-scheduler #add it in pod definition file
```
View Events:
```bash 
kubectl get events
```
View Scheduler Logs:
```bash 
kubectl logs my-custom-scheduler --name-space=kube-system
```
---
# Metrics Server
```bash 
git clone https://github.com/kubernetes-incubator/metrics-server.git
```
get top node
```bash
kubectl top node
```
---
# Rollout
1. Check the status of a rollout
```bash
kubectl rollout status deployment/<deployment-name>
```
2. Undo a rollout (rollback to the previous revision)
```bash
kubectl rollout undo deployment/<deployment-name>
```
3. View rollout history
```bash
kubectl rollout history deployment/<deployment-name>
```
4. Pause a rollout
```bash
kubectl rollout pause deployment/<deployment-name>
```
5. Resume a rollout
```bash
kubectl rollout resume deployment/<deployment-name>
```
---
# Command and Args
```yaml
apiVersion: v1 
kind: Pod 
metadata:
  name: ubuntu-sleeper-2 
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command:
      - "sleep"
      - "5000"
```      
---
# ConfigMap
### apiVersion: v1
declarative
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_ENV: "production"
  DB_HOST: "db-service"
  DB_PORT: "5432"
```
add the configmap to pod definition file
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app-pod
spec:
  containers:
  - name: app-container
    image: ubuntu
    envFrom: #is a list
    - configMapRef:
        name: app-config
```     
the POD to use only the APP_COLOR key from the newly created ConfigMap   
```yaml 
---
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: webapp-color
  name: webapp-color
  namespace: default
spec:
  containers:
  - env:
    - name: APP_COLOR
      valueFrom:
        configMapKeyRef:
          name: webapp-config-map
          key: APP_COLOR
    image: kodekloud/webapp-color
    name: webapp-color
```    
imperative
```bash
kubectl create configmap app-config --from-literal=APP_ENV=production --from-literal=DB_HOST=db-service --from-literal=DB_PORT=5432
```
or from txt file 
```bash
kubectl create configmap app-config --from-file=config.txt
```
get configmap
```bash
kubectl get configmaps
```
describe configmap 
```bash
kubectl describe configmaps
```
---
# Secrets
### apiVersion: v1
imperative:
```bash
kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=supersecret
```
from a file
```bash 
kubectl create secret generic my-cert-secret --from-file=cert.crt=/path/to/certificate.crt --from-file=key.key=/path/to/private.key
```
env:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: YWRtaW4=   # (Base64 encoded string for "admin")
  password: c3VwZXJzZWNyZXQ=  # (Base64 encoded string for "supersecret")
```
single env :
```yaml 
env:
- name: DB_Password
  valueFrom:
    secretKeyRef:
      name: app-secret
      key: DB_Password
```
envFrom:
```yaml
envFrom:
    - secretRef:
        name: db-secret
```        
volums :
```yaml
volumes:
- name: app-secret-volume
  secret:
    secretName: app-secret
```
add it to pod 
```yaml 
apiVersion: v1
kind: Pod
metadata:
  name: webapp-pod
spec:
  containers:
  - name: webapp-container
    image: my-app-image
    env:
    - name: DB_USERNAME
      valueFrom:
        secretKeyRef:
          name: my-secret    
          key: username 
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret    
          key: password 
```
encode secrets
```bash 
echo -n "abeer" | base64
```
decode secrets
```bash
echo -n "YWJlZXI=" | base64 --decode
```
get secrets
```bash
kubectl get secrets
```
describe secrets 
```bash
kubectl describe secrets
```
set a secret to a deployment
```bash
kubectl set env deployment/myapp DB_USERNAME=admin DB_PASSWORD=supersecret
```
another way
```bash
kubectl set env deployment myapp --from=<secret-name>
```
[https://www.youtube.com/watch?v=MTnQW9MxnRI] (Secret Store CSI Driver Tutorial | Kubernetes Secrets )
---
# Multi Container PODs
Practice Test - Multi Container PODs
 ```bash
 kubectl -n elastic-stack exec -it app -- cat /log/app.log
 ```
---
# InitContainers
```yaml 
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox:1.28
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'git clone <some-repository-that-will-be-used-by-application> ; done;']
```
When a POD is first created the initContainer is run, and the process in the initContainer must run to a completion before the real container hosting the application starts. 

You can configure multiple such initContainers as well, like how we did for multi-containers pod. In that case each init container is run one at a time in sequential order.

If any of the initContainers fail to complete, Kubernetes restarts the Pod repeatedly until the Init Container succeeds.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox:1.28
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox:1.28
    command: ['sh', '-c', 'until nslookup myservice; do echo waiting for myservice; sleep 2; done;']
  - name: init-mydb
    image: busybox:1.28
    command: ['sh', '-c', 'until nslookup mydb; do echo waiting for mydb; sleep 2; done;']
```
--- 
# OS upgrade
Draining node
```bash
kubectl drain <node-name> --ignore-daemonsets --delete-local-data
```
Uncordon node
```bash
kubectl uncordon <node-name>
```
*pods will not reschudeled in the uncordon node only the new created ones!*  
Cordoning node (unschedulable):
```bash
kubectl cordon <node-name>
```
What is the current version of the cluster?   
run 
```bash 
kubectl get nodes
``` 
and look at the **VERSION**
What is the latest version available for an upgrade with the current version of the kubeadm tool installed?     
Run the ```kubeadm upgrade plan``` command
**update kubeadm**
Use any text editor you prefer to open the file that defines the Kubernetes apt repository.   
```bash
vim /etc/apt/sources.list.d/kubernetes.list
```
Update the version in the URL to the next available minor release, i.e v1.31.  
```bash
apt update
apt-cache madison kubeadm
```
then 
```bash 
apt-get install kubeadm=1.31.0-1.1
```
Run the following command to upgrade the Kubernetes cluster:  
```bash
kubeadm upgrade plan v1.31.0

kubeadm upgrade apply v1.31.0
```
Now, upgrade the Kubelet version. Also, mark the node (in this case, the "controlplane" node) as schedulable.  
```bash
apt-get install kubelet=1.31.0-1.1
```
Run the following commands to refresh the systemd configuration and apply changes to the Kubelet service:  
```bash
systemctl daemon-reload

systemctl restart kubelet
```
[https://v1-31.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/#call-kubeadm-upgrade]

## upgrade worker node
On the node01 node, run the following commands:  
**If you are on the controlplane node, run ssh node01 to log in to the node01.**  
Use any text editor you prefer to open the file that defines the Kubernetes apt repository.  
```bash
vim /etc/apt/sources.list.d/kubernetes.list
```
Update the version in the URL to the next available minor release, i.e v1.31.  
After making changes, save the file and exit from your text editor. Proceed with the next instruction.
```bash
apt update

apt-cache madison kubeadm
```
Based on the version information displayed by apt-cache madison, it indicates that for Kubernetes version 1.31.0, the available package version is 1.31.0-1.1. Therefore, to install kubeadm for Kubernetes v1.31.0, use the following command:  
```bash
apt-get install kubeadm=1.31.0-1.1
```
Upgrade the node 
```bash
kubeadm upgrade node  
```
Now, upgrade the Kubelet version.  
```bash
apt-get install kubelet=1.31.0-1.1
```
Run the following commands to refresh the systemd configuration and apply changes to the Kubelet service:  
```bash
systemctl daemon-reload

systemctl restart kubelet
```
Type exit or logout or enter CTRL + d to go back to the controlplane node.  
---
# Backup and Restore Methods
ETCD 
install 
```bash 
sudo apt update
sudo apt install etcd -y
sudo systemctl start etcd
sudo systemctl enable etcd
export ETCDCTL_API=3 #to use snapshot
```
Where is the ETCD Certificate file located? **/etc/kubernetes/pki/etcd/server.crt**
Backup and Restore Methods? **/etc/kubernetes/pki/etcd/ca.crt**
Take a snapshot of the ETCD database using the built-in snapshot functionality.Store the backup file at location /opt/snapshot-pre-boot.db
```bash
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
```
restore snapshot:
```bash
ETCDCTL_API=3 etcdctl  --data-dir /var/lib/etcd-backup \
snapshot restore /opt/snapshot-pre-boot.db
```
Next, update the /etc/kubernetes/manifests/etcd.yaml:   
We have now restored the etcd snapshot to a new path on the controlplane - /var/lib/etcd-from-backup, so, the only change to be made in the YAML file, is to change the hostPath for the volume called etcd-data from old directory (/var/lib/etcd) to the new directory (/var/lib/etcd-from-backup).
```bash
 vi /etc/kubernetes/manifests/etcd.yaml 
```
```yaml
  volumes:
  - hostPath:
      path: /var/lib/etcd-backup
      type: DirectoryOrCreate
    name: etcd-data
```
---
# clusters
get clusters:
```bash
kubectl config get-clusters 
```
switch the context to cluster1:
```bash
kubectl config use-context cluster1
```
```bash 
ssh cluster2-controlplane ps -ef | grep etcd
```
to get cert, endpoints, casert and key
```bash
kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep pki
```
!!!! ==> scp is a Secure Copy Protocol by ssh 
```bash
chown -R [OWNER][:GROUP] /path/to/directory
```
