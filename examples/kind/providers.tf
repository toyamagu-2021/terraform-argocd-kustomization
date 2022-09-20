provider "kubernetes" {
  host                   = kind_cluster.this.endpoint
  cluster_ca_certificate = kind_cluster.this.cluster_ca_certificate
  client_certificate     = kind_cluster.this.client_certificate
  client_key             = kind_cluster.this.client_key
}

provider "kind" {}


provider "kustomization" {
  # Configuration options
  #kubeconfig_path = ".kube/config"
  kubeconfig_raw = kind_cluster.this.kubeconfig
}
