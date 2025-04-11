# Create a Kubernetes secret
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
