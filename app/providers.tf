provider "kubernetes" {
  config_path = "~/.kube/config"
  #   context        = "gke_bootcamp-project-gke_us-west1-a_binyamin-app"
}

terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }

}

data "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }
  # depends_on = [null_resource.get_gke_credentials]
}

data "external" "fetch_argocd_password" {
  program = ["${path.module}/fetch_argocd_password.sh"]

  #  depends_on = [null_resource.get_gke_credentials]
}

provider "argocd" {
  server_addr = data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].ip
  insecure    = true
  username    = var.argocd_user
  password    = data.external.fetch_argocd_password.result["password"]
}




