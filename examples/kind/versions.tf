terraform {
  required_version = "~>1.3"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~>2"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "~>0"
    }
    kustomization = {
      source  = "kbst/kustomization"
      version = "~>0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2"
    }
  }
}
