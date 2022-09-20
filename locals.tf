locals {
  argocd_url = format(
    "%s/%s/%s/%s",
    var.argocd_url,
    var.argocd_version,
    var.ha_enabled ? var.argocd_path_ha : var.argocd_path,
    var.namespace_enabled ? var.argocd_manifest_namespace_install : var.argocd_manifest_cluster_install
  )

  default_patches_options = {

  }
}
