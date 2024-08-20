# azure-gitops
Deploy Azure Infrastructure via GitOps

First, deploy the AKS cluster: 
az aks create --resource-group rg-sam-gitops-test --name gitops-test-1 --node-count 2 --enable-oidc-issuer --location centralus
az aks get-credentials --resource-group rg-sam-gitops-test --name gitops-test-1 --overwrite-existing
kubectl -n argocd get services -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.loadBalancer.ingress[*].ip}{"\n"}{end}'
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

## Commands
1. Getting host name -> use json view in aks cluster resource and look for issuerUrl
2. Getting CA Certificate -> use "az aks get-credentials --resource-group rg-aksautomatic-test-chn-1 --name aks-automatic-test-chn-1 --overwrite-existing" and switch to /.kube directory then open config file via "cat config" and copy certificate information
3. Apply TF for infrastructure part
4. Get the public IP of argocd -> "kubectl -n argocd get services -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.loadBalancer.ingress[*].ip}{"\n"}{end}'"
5. Open ArgcoCD in browser and accept without certificate 
6. Get credentials for argocd admin login:
user:
admin
secret:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
7. Create Repo Connect in ArgoCD UI via https for public repo
8. Change MSI Id gitops directory file: crossplane_provider_azure_config.yaml with kubelet identity (you can find this also via json view on aks resource and look for clientId at kubeletidentity)