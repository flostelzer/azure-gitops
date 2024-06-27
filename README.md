# azure-gitops
Deploy Azure Infrastructure via GitOps


## Commands
Get the public IP of argocd:
kubectl -n argocd get services -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.loadBalancer.ingress[*].ip}{"\n"}{end}'

Get credentials for argocd admin login:
user:
admin
secret:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo