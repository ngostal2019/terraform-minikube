terraform {
  required_version = ">=1.0.0"
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.2.8"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}