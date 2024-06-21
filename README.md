# azure_gitops
Deploy Azure Infrastructure via GitOps


## Commands
Get credentials for argocd admin login:
user:
admin
secret:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo