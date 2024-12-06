# APISERVER
**video 16**  
when using command 
```bash 
kubectl get node
``` 
The kube utility is reaching to the kube-apiserver. The kube-apiserver authenticates the request and validates it. It the retrieves the data from the etcd cluster and responds back with the requested information.   

when using command 
```bash 
kubectl create pod 
``` 
the request is *authenticated first and then validated*.In this case, the API server creates a pod object without assigning it to a node. Updates the information in the *etcd server*, updates the *user that the pod has been created*.  
*The scheduler continuously monitors the API server* and realizes that there is a new pod with no node assigned.  
The *scheduler identifies the right node* to place the new pod on and communicates that back to the *kube-apiserver*. *The API server* then updates the information in the *etcd cluster*. The *API server* then passes that information to the *kubelet* in the appropriate worker node. The kubelet then creates the pod on the node and instructs the container runtime engine to deploy the application image. Once done, the kubelet updates the status back to the API server and the API server then updates the data back in the etcd cluster.
