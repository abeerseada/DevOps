#kuberview
1- install helm
```bash 
brew install helm
```
2- Add the KubeView Helm repository
```bash 
helm repo add kubeview https://benc-uk.github.io/kubeview/charts
helm repo update
```
3- Install KubeView
```bash
helm install kubeview kubeview/kubeview --set image.pullPolicy=IfNotPresent
```
4- Access KubeView
```bash 
kubectl port-forward svc/kubeview 7000:80
```
Open your browser and navigate to: http://localhost:7000
---