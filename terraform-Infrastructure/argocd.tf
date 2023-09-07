resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.31.0"  
  namespace  = "argocd"
  create_namespace = true
  
  set {
    name = "server.service.type"
    value = "LoadBalancer"
  }
}