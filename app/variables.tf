variable "app_name" {
  type        = string
  description = "Name of the app in Argocd"
}

variable "app_namespace" {
  type        = string
  description = "Namespace of the app in Argocd"
}

variable "app_repo_url" {
  type        = string
  description = "Repository of the app in Argocd"
}

variable "app_path" {
  type        = string
  description = "Path to the app in Argocd"
}

variable "backend_bucket" {
  type        = string
  description = "Backend bucket name"
}

variable "argocd_user" {
  type        = string
  description = "ArgoCD username"
}
