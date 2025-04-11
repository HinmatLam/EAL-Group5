# Example of using the secret in a deployment
resource "kubernetes_deployment" "this" {
  # ... other configurations ...

  spec {
    # ... other configurations ...

    container {
      # ... other configurations ...

      env {
        name  = "DB_USERNAME"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.this.metadata[0].name
            key  = "username"
          }
        }
      }

      env {
        name  = "DB_PASSWORD"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.this.metadata[0].name
            key  = "password"
          }
        }
      }
    }
  }
}
