# Cannot depends on any resource
data "kustomization_overlay" "argocd" {
  resources = [
    local.argocd_url
  ]
  namespace = var.argocd_namespace
}

# first loop through resources in ids_prio[0]
resource "kustomization_resource" "p0" {
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
resource "kustomization_resource" "p1" {
  for_each = data.kustomization_overlay.argocd.ids_prio[1]

  manifest = (
    contains(["_/Secret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_overlay.argocd.manifests[each.value])
    : data.kustomization_overlay.argocd.manifests[each.value]
  )

  depends_on = [kustomization_resource.p0]
}

# finally, loop through resources in ids_prio[2]
# and set an explicit depends_on on kustomization_resource.p1
resource "kustomization_resource" "p2" {
  for_each = data.kustomization_overlay.argocd.ids_prio[2]

  manifest = (
    contains(["_/Secret"], regex("(?P<group_kind>.*/.*)/.*/.*", each.value)["group_kind"])
    ? sensitive(data.kustomization_overlay.argocd.manifests[each.value])
    : data.kustomization_overlay.argocd.manifests[each.value]
  )

  depends_on = [kustomization_resource.p1]
}

resource "kubernetes_namespace" "argocd" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.argocd_namespace
  }
}
