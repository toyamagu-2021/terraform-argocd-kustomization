# Cannot depends on any resource
data "kustomization_overlay" "argocd" {
  resources = [
    local.argocd_url
  ]
  namespace = var.argocd_namespace

  dynamic "patches" {
    for_each = { for i, v in var.patches : i => v }
    content {
      patch = try(patches.value.patch, "")
      path  = try(patches.value.path, "")

      dynamic "target" {
        for_each = patches.value.target != null ? { for i, v in patches.value.target : i => v } : {}
        content {
          group               = try(target.value.group, null)
          version             = try(target.value.version, null)
          kind                = try(target.value.kind, null)
          name                = try(target.value.name, null)
          namespace           = try(target.value.namespace, null)
          label_selector      = try(target.value.label_selector, null)
          annotation_selector = try(target.value.annotation_selector, null)
        }
      }

      dynamic "options" {
        for_each = patches.value.options != null ? { for i, v in patches.value.options : i => v } : {}
        content {
          allow_name_change = try(options.value.allow_name_change, false)
          allow_kind_change = try(options.value.allow_kind_change, false)
        }
      }
    }
  }
}

# first loop through resources in ids_prio[0]
resource "kustomization_resource" "argocd_p0" {
  for_each = data.kustomization_overlay.argocd.ids_prio[0]

  manifest = (
    contains(["_/Secret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_overlay.argocd.manifests[each.value])
    : data.kustomization_overlay.argocd.manifests[each.value]
  )
  depends_on = [
    kubernetes_namespace.argocd
  ]
}

# then loop through resources in ids_prio[1]
# and set an explicit depends_on on kustomization_resource.p0
resource "kustomization_resource" "argocd_p1" {
  for_each = data.kustomization_overlay.argocd.ids_prio[1]

  manifest = (
    contains(["_/Secret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_overlay.argocd.manifests[each.value])
    : data.kustomization_overlay.argocd.manifests[each.value]
  )

  depends_on = [kustomization_resource.argocd_p0]
}

# finally, loop through resources in ids_prio[2]
# and set an explicit depends_on on kustomization_resource.p1
resource "kustomization_resource" "argocd_p2" {
  for_each = data.kustomization_overlay.argocd.ids_prio[2]

  manifest = (
    contains(["_/Secret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_overlay.argocd.manifests[each.value])
    : data.kustomization_overlay.argocd.manifests[each.value]
  )

  depends_on = [kustomization_resource.argocd_p1]
}

resource "kubernetes_namespace" "argocd" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.argocd_namespace
  }
}
