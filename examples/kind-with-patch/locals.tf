locals {
  kind = {
    cluster_name = var.kind_cluster_name
  }

  patches = [
    {
      patch = templatefile("./patches/argocd-cm.yaml.tftpl", {
        url : "https://patched.example.com"
      })
    },
    {
      target = [
        {
          kind = "Deployment"
          name = "argocd-server"
        }
      ]
      patch = <<-EOF
        - op: replace
          path: /spec/replicas
          value: 2
      EOF
    }
  ]
}
