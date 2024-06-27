resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = var.argocd_config.name
  repository = var.argocd_config.repository
  chart      = var.argocd_config.chart
  version    = var.argocd_config.version
  namespace  = kubernetes_namespace.argocd.id

  values = [
    templatefile("argocd_values.yaml", {})
  ]
}

resource "kubectl_manifest" "app_of_apps_infrastructure" {
  depends_on = [helm_release.argocd]

  yaml_body = file("${path.module}/../gitops/app_of_apps_platform_apps.yaml")
}