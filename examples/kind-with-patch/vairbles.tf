variable "kind_cluster_name" {
  description = "Kind cluster name"
  type        = string
  default     = "kind-cluster"
}

variable "argocd_apps_repo" {
  description = "Argocd apps repository."
  type        = string
  default     = "https://github.com/toyamagu-2021/terraform-argocd-kustomize.git"
}

variable "argocd_apps_target_revision" {
  description = "Argocd apps target revision."
  type        = string
  default     = "argocd-apps-helm"
}
