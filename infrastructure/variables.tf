variable "gcp_credentials" {
    type = string
    description = "Location of service account for GCP"
}

variable "gcp_project_id" {
    type = string
    description = "GCP project id"
}

variable "gcp_region" {
    type = string
    description = "GCP region" 
}

variable "gke_cluster_name" {
    type = string
    description = "GKE cluster name" 
}

variable "gke_zones" {
    type = list(string)
    description = "List of zones for the GKE cluster"
}

variable "gke_network" {
    type = string
    description = "VPC Network name"
}

variable "gke_subnetwork" {
    type = string
    description = "VPC Sub Network name"
}

variable "gke_default_nodepool_name" {
    type = string
    description = "GKE Default nodepool name"
}

variable "gke_service_account_name" {
    type = string
    description = "GKE Service Account Name"  
}



