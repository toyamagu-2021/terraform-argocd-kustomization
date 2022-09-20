# examples/kind

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.0.13 |
| <a name="requirement_kustomization"></a> [kustomization](#requirement\_kustomization) | 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kind"></a> [kind](#provider\_kind) | 0.0.13 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd"></a> [argocd](#module\_argocd) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [kind_cluster.this](https://registry.terraform.io/providers/tehcyx/kind/0.0.13/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kind_cluster_name"></a> [kind\_cluster\_name](#input\_kind\_cluster\_name) | Kind cluster name | `string` | `"kind-cluster"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->