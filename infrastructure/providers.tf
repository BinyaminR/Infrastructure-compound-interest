provider "google" {
  credentials = file(var.gcp_credentials)
  project = var.gcp_project_id
  region = var.gcp_region
}

# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}


provider "kubernetes" {
  config_path    = "~/.kube/config"
#   context        = "gke_bootcamp-project-gke_us-west1-a_binyamin-app"
  
}


provider "helm" {
   kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
 }
}

# terraform {
#   required_providers {
#     argocd = {
#       source = "oboukili/argocd"
#       version = "6.0.3"
#     }
#   }
 
# }

# data "kubernetes_service" "argocd_server" {
#   metadata {
#     name      = "argocd-server" 
#     namespace = "argocd"
#   }
#   depends_on = [
#     helm_release.argocd,
#     null_resource.get_gke_credentials
#   ]
# }

# data "external" "fetch_argocd_password" {
#   program = ["${path.module}/fetch_argocd_password.sh"]

#   depends_on = [
#     helm_release.argocd,
#     null_resource.get_gke_credentials
#   ]
# }

# provider "argocd" {
#   server_addr = data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].ip
#   insecure    = true
#   username    = "admin"
#   password    = data.external.fetch_argocd_password.result["password"]
# }




