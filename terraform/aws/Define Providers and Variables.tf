# Define the provider for AWS (or any other cloud provider)
provider "aws" {
  region = "us-east-1"
}

# Define variables for your resources
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
