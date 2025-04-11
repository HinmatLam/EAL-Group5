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
