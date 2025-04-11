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
