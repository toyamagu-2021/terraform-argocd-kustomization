resource "kind_cluster" "this" {
  name           = local.kind.cluster_name
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role  = "control-plane"
      image = "kindest/node:v1.23.10"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.10"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.10"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.10"
    }
  }
}

module "argocd" {
  source              = "../../"
  argocd_applications = local.argocd_applications
  argocd_projects     = local.argocd_projects
  argocd_version      = var.argocd_version
}

resource "kubernetes_namespace" "child-apps" {
  metadata {
    name = "child-apps"
  }
}

