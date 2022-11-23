locals {
  kind = {
    cluster_name = var.kind_cluster_name
  }
}

# argocd-apps
locals {
  argocd_applications_vars = {
    repo_url        = var.argocd_apps_repo
    target_revision = var.argocd_apps_target_revision
    path            = "examples/kind/argocd/guestbook"
  }
  argocd_applications = [
    templatefile("${path.module}/argocd/applications/applications.tftpl.yaml", local.argocd_applications_vars)
  ]
  argocd_projects_vars = {
  }
  argocd_projects = [
    templatefile("${path.module}/argocd/projects/projects.tftpl.yaml", local.argocd_projects_vars)
  ]
}
