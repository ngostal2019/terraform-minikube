provider "minikube" {
  kubernetes_version = var.kubernetes_version
}

provider "kubernetes" {
  host = minikube_cluster.hyperv.host

  client_certificate     = minikube_cluster.hyperv.client_certificate
  client_key             = minikube_cluster.hyperv.client_key
  cluster_ca_certificate = minikube_cluster.hyperv.cluster_ca_certificate
}