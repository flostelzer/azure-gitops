variable "aks_cluster" {
  type = object({
    name           = string
    rg_name        = string
    host           = string
    ca_certificate = string
  })
  description = "This defines the parameters for connecting to the aks cluster."
}

variable "argocd_config" {
  type = object({
    name       = string
    repository = string
    chart      = string
    version    = string
  })
  description = "This defines the parameters for configuration of argocd."
}