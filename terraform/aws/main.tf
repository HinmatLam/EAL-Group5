# Define providers and variables
provider "aws" {
  region = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_password" {
  type = string
  sensitive = true
}

# Create VPC and subnets
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "private1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.this.id
}

resource "aws_subnet" "private2" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.this.id
}

# Create EKS cluster
resource "aws_eks_cluster" "this" {
  name     = "k8s-cluster"
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "k8s-nodes"
  subnet_ids      = [aws_subnet.private1.id, aws_subnet.private2.id]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }
}

# Create database
resource "aws_db_instance" "this" {
  identifier           = "k8s-db"
  instance_class       = "db.t2.micro"
  engine               = "postgres"
  username             = var.db_username
  password             = var.db_password
}

# Configure Kubernetes provider
provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
}

# Create Kubernetes namespace
resource "kubernetes_namespace" "this" {
  metadata {
    name = "k8s-app"
  }
}

# Create Kubernetes deployment
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

# Create Kubernetes service
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

# Create Kubernetes secret
resource "kubernetes_secret" "this" {
  metadata {
    name      = "db-credentials"
    namespace = kubernetes_namespace.this.metadata[0].name
  }

  data = {
    username = var.db_username
    password = var.db_password
  }
}
