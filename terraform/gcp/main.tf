# Define providers and variables
provider "google" {
  project = var.project_id
  region  = var.region
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
  default = "gke-cluster"
}

variable "k8s_version" {
  type = string
  default = "1.27"
}

variable "machine_type" {
  type = string
  default = "g1-small"
}

variable "node_count" {
  type = number
  default = 2
}

# Create a VPC
resource "google_compute_network" "vpc" {
  name                    = "gke-vpc"
  auto_create_subnetworks = false
}

# Create a subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "gke-subnet"
  ip_cidr_range = "10.1.0.0/16"
  network       = google_compute_network.vpc.id
  region        = var.region
}

# Create a GKE cluster
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  project            = var.project_id
  initial_node_count = var.node_count

  # Use a private cluster
  private_cluster_config {
    enable_private_nodes = true
    master_ipv4_cidr_block = "10.0.0.0/28"
  }

  # Use a network policy
  network_policy {
    enabled = true
  }

  # Use a maintenance window
  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }
}

# Create a node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-nodes"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id
  node_count = var.node_count

  node_config {
    preemptible  = false
    machine_type = var.machine_type

    # Use a service account for the nodes
    service_account {
      email  = google_service_account.gke_nodes.email
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }
}

# Create a service account for the nodes
resource "google_service_account" "gke_nodes" {
  account_id = "gke-nodes-sa"
}

# Configure the Kubernetes provider
provider "kubernetes" {
  host                   = "<https://${google_container_cluster.primary.private_cluster_config>[0].master_ipv4_cidr_block}"
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["gcloud", "container", "clusters", "get-credentials", google_container_cluster.primary.name, "--region", var.region, "--project", var.project_id]
    command     = "gcloud"
  }
}
