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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kustomization"></a> [kustomization](#requirement\_kustomization) | 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.13.1 |
| <a name="provider_kustomization"></a> [kustomization](#provider\_kustomization) | 0.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kustomization_resource.p0](https://registry.terraform.io/providers/kbst/kustomization/0.9.0/docs/resources/resource) | resource |
| [kustomization_resource.p1](https://registry.terraform.io/providers/kbst/kustomization/0.9.0/docs/resources/resource) | resource |
| [kustomization_resource.p2](https://registry.terraform.io/providers/kbst/kustomization/0.9.0/docs/resources/resource) | resource |
| [kustomization_overlay.argocd](https://registry.terraform.io/providers/kbst/kustomization/0.9.0/docs/data-sources/overlay) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_manifest_cluster_install"></a> [argocd\_manifest\_cluster\_install](#input\_argocd\_manifest\_cluster\_install) | ArgoCD manifest name for the cluster-install mode. | `string` | `"install.yaml"` | no |
| <a name="input_argocd_manifest_namespace_install"></a> [argocd\_manifest\_namespace\_install](#input\_argocd\_manifest\_namespace\_install) | ArgoCD manifest name for the namespace-install mode. | `string` | `"namespace-install.yaml"` | no |
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | ArgoCD namespace | `string` | `"argocd"` | no |
| <a name="input_argocd_path"></a> [argocd\_path](#input\_argocd\_path) | ArgoCD manifest path for non-HA mode | `string` | `"manifests"` | no |
| <a name="input_argocd_path_ha"></a> [argocd\_path\_ha](#input\_argocd\_path\_ha) | ArgoCD manifest path for HA mode | `string` | `"manifests/ha"` | no |
| <a name="input_argocd_url"></a> [argocd\_url](#input\_argocd\_url) | Argocd url | `string` | `"https://raw.githubusercontent.com/argoproj/argo-cd"` | no |
| <a name="input_argocd_version"></a> [argocd\_version](#input\_argocd\_version) | Argocd version. e.g.) v1.0.0 | `string` | `"master"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create namespace | `bool` | `true` | no |
| <a name="input_ha_enabled"></a> [ha\_enabled](#input\_ha\_enabled) | ArgoCD is HA mode | `bool` | `false` | no |
| <a name="input_namespace_enabled"></a> [namespace\_enabled](#input\_namespace\_enabled) | ArgoCD is namespace-install | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->