data "azurerm_kubernetes_cluster" "aks_automatic" {
  name                = var.aks_cluster.name
  resource_group_name = var.aks_cluster.rg_name
}