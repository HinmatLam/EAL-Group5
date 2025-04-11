# Define the provider for GCP
provider "google" {
  project = var.project_id
  region  = var.region
}

# Define variables for your resources
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
