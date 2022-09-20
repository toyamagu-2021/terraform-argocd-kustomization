# examples/kind

## Description

- kustomize with patch example

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
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd"></a> [argocd](#module\_argocd) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [kind_cluster.this](https://registry.terraform.io/providers/tehcyx/kind/0.0.13/docs/resources/cluster) | resource |
| [kubernetes_namespace.child-apps](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_apps_repo"></a> [argocd\_apps\_repo](#input\_argocd\_apps\_repo) | Argocd apps repository. | `string` | `"https://github.com/toyamagu-2021/terraform-argocd-kustomize.git"` | no |
| <a name="input_argocd_apps_target_revision"></a> [argocd\_apps\_target\_revision](#input\_argocd\_apps\_target\_revision) | Argocd apps target revision. | `string` | `"main"` | no |
| <a name="input_argocd_version"></a> [argocd\_version](#input\_argocd\_version) | ArgoCD version | `string` | `"master"` | no |
| <a name="input_kind_cluster_name"></a> [kind\_cluster\_name](#input\_kind\_cluster\_name) | Kind cluster name | `string` | `"kind-cluster"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->