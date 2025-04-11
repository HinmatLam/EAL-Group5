# Configure the Kubernetes provider
provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.this.name]
    command     = "aws"
  }
}

# Create a Kubernetes namespace
resource "kubernetes_namespace" "this" {
  metadata {
    name = "k8s-app"
  }
}

# Create a Kubernetes deployment
resource "kubernetes_deployment" "this" {
  metadata {
    name      = "k8s-deployment"
    namespace = kubernetes_namespace.this.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "k8s-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "k8s-app"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Create a Kubernetes service
resource "kubernetes_service" "this" {
  metadata {
    name      = "k8s-service"
    namespace = kubernetes_namespace.this.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.this.spec.template.metadata.labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
