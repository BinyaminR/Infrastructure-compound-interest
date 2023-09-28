
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.4.7" 
  namespace  = "argocd"
  create_namespace = true
  
  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  # set {
  #   name  = "server.admin.password"
  #   value = "emanuel22"
  # }

  # ... any other configuration ...

  # depends_on = [null_resource.get_gke_credentials]
}





