resource "argocd_application" "compound_interest" {
  metadata {
    name      = var.app_name
    # If you need to specify namespace or other metadata attributes, add them here.
    # e.g., namespace = "some-namespace"
  }

  spec {
    destination {
      namespace = var.app_namespace
      server    = "https://kubernetes.default.svc"
    }

    source {
      path            = var.app_path
      repo_url        = var.app_repo_url
      target_revision = "HEAD"
    }

    project = "default"

    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }

      sync_options = ["CreateNamespace=true"]
    }
  }

}
resource "null_resource" "create_webhook" {
  provisioner "local-exec" {
    command = "kubectl -n argocd patch secret argocd-secret -p '{\"stringData\": {\"webhook.github.secret\": \"emanuel\"}}'"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}



