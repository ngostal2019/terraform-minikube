# Create cluster and enable addons
resource "minikube_cluster" "hyperv" {
  driver       = "hyperv"
  cluster_name = "terraform-provider-minikube"
  addons = var.minikube_addons
}

# Kubernetes Deployment
resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "terraform-nginx-deploy"
    labels = var.labels_app
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = var.labels_app
    }
    template {
      metadata {
        labels = var.labels_app
      }
      spec {
        container {
          image = var.nginx_image
          name  = "terraform-nginx-container"

          port {
            container_port = var.port
          }

          resources {
            limits   = var.limits
            requests = var.requests
          }
        }
      }
    }
  }
}

# Kubernetes service
resource "kubernetes_service" "nginx-svc" {
  metadata {
    name = "terraform-nginx-svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment.deployment.spec.0.template.0.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = var.port
      target_port = var.port
    }

    type = var.service_type
  }
}

# Kubernetes Ingress
resource "kubernetes_ingress_v1" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
    }
  }
  spec {
    rule {
      host = minikube_cluster.hyperv.cluster_name
      http {
        path {
          path_type = "Prefix"
          path      = "/"
          backend {
            service {
              name = kubernetes_service.nginx-svc.metadata.0.name
              port {
                number = var.port
              }
            }
          }
        }
      }
    }
  }
}