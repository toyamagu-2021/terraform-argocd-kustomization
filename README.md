# terraform-argocd-kustomization

## Description

- Install ArgoCD to one's cluster by [kbst/terraform-provider-kustomization](https://github.com/kbst/terraform-provider-kustomization)
- By design of the provider, *THIS MODULE COULD NOT DEPEND ON ANY TERRAFORM RESOURCE*

## USAGE

```terraform
provider "kustomization" {
  # Choose one
  ## kubeconfig_path = <KUBECONFIG_PATH>
  ## kubeconfig_raw = <KUBECONFIG_RAW_DATA>
}

module "argocd" {
  source = "github.com/toyamagu-2021/terraform-argocd-kustomization"
}
```
