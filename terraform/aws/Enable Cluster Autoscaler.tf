# Enable cluster autoscaler
resource "aws_eks_node_group" "this" {
  # ... other configurations ...

  # Enable cluster autoscaler
  instance_types = ["t2.medium"]
  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }
}
