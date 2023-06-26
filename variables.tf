variable "minikube_addons" {
    type = list(string)
    default = ["default-storageclass","ingress","dashboard"]
}
variable "port" {
  description = "Common port -> container | service | ingress"
  type        = number
  default     = 80
}

variable "limits" {
  type = map(string)
  default = {
    cpu    = "0.5"
    memory = "512Mi"
  }
}

variable "requests" {
  type = map(string)
  default = {
    cpu    = "250m"
    memory = "60Mi"
  }
}

variable "kubernetes_version" {
    type = string
    default = "v1.26.3"
}

variable "nginx_image" {
    type = string
    default = "nginx:1.7.8"
}

variable "labels_app" {
    type = map(string)
    default = {
        app = "StalineNgoma"
    }
}

variable "replicas" {
    type = number
    default = 2
}

variable "service_type" {
    type = string
    default = "ClusterIP"
}