# GCP GKE Deployment Repository: README

## Overview

Welcome to the GCP GKE Deployment Repository! This space has been meticulously set up to streamline the process of deploying infrastructure and applications on Google Cloud Platform (GCP) using distinct branch-based triggers:

- `main`: Houses fundamental configurations and essential documentation.
- `app`: Dedicated to application-specific configurations and setups.
- `infra`: Manages infrastructure-centric configurations, with a keen focus on GCP GKE (Google Kubernetes Engine) clusters.

## Branch-driven Deployments

1. **infra**:
    - A push to this branch springs into action by creating a GKE cluster within GCP.
    - With the cluster fully operational, Prometheus, Grafana, and ArgoCD are deployed using their distinct Helm charts. Notably, each gets its dedicated Kubernetes namespace for seamless operations.
    
2. **app**:
    - A push to this branch signals the deployment of the associated application on the pre-established GKE cluster courtesy of ArgoCD.
    - To aid in monitoring, Grafana dashboards tailored to the application are seamlessly integrated.

## Essential Configurations

### GCP Credential Management:
To adapt the Terraform's GCP provider setup:
```hcl
provider "google" {
  credentials = var.gcp_credentials
  project = var.gcp_project_id
  region  = var.gcp_region
}
```
Modify it to:

```hcl
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
```

Post this alteration, ensure the GCP credentials are securely stored as secrets within your CI/CD setup. Our intricately designed workflow will deftly map these secrets to the pertinent variables, ensuring a smooth deployment process.

### Streamlined GKE Cluster Connection:
Our initialization script includes:

```bash
gcloud container clusters get-credentials binyamin-app --zone us-west1-a --project bootcamp-project-gke
```

Ensure you customize the cluster name (`binyamin-app`), zone (`us-west1-a`), and project (`bootcamp-project-gke`) to mirror your GCP configurations.

## Wrapping Up

This repository has been crafted to ensure an intuitive deployment experience on GCP. However, should you encounter challenges or have queries, our comprehensive documentation and support channels are at your disposal.

