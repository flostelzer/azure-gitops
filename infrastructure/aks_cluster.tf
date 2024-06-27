data "azurerm_kubernetes_cluster" "aks_automatic" {
  name                = var.aks_cluster.name
  resource_group_name = var.aks_cluster.rg_name
}

resource "azurerm_role_assignment" "creating_resources" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_kubernetes_cluster.aks_automatic.kubelet_identity[0].object_id
}