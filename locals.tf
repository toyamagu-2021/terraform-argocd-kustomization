locals {
  argocd_url = format(
    "%s/%s/%s/%s",
    var.argocd_url,
    var.argocd_version,
    var.ha_enabled ? var.argocd_path_ha : var.argocd_path,
    var.namespace_enabled ? var.argocd_manifest_namespace_install : var.argocd_manifest_cluster_install
  )
}

locals {
  helm_config = {
    timeout          = 1200
    create_namespace = false
  }

  argocd_apps = {
    name         = var.argocd_apps_name
    namespace    = var.argocd_namespace
    helm_repo    = var.argocd_helm_repo
    helm_chart   = var.argocd_apps_helm_chart
    helm_version = var.argocd_apps_helm_version
    helm_values  = concat(var.argocd_projects, var.argocd_applications)
  }
}
