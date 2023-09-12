# Infrastructure-compound-interest

This repository contains the infrastructure as code (IaC) configurations for the DevOps application, which is a part of a larger ecosystem composed of three repositories:

**Application**: [Application Repo](https://github.com/BinyaminR/Application-compound-interest)

 **GitOps** : [GitOps Repo](https://github.com/BinyaminR/Gitops-compound-interest)
 
 **Infrastructure** (Current repository): [Infrastructure Repo](https://github.com/BinyaminR/Infrastructure-compound-interest)

## Overview

The Infrastructure repository is responsible for provisioning and managing the cloud infrastructure required for the application. It utilizes Terraform to provision and manage all required cloud infrastructure on Google Kubernetes Engine (GKE), making it highly replicable and version-controlled. The repository also includes configurations for deploying ArgoCD and Prometheus in the GKE cluster.

### Key Components:

1. **Google Kubernetes Engine (GKE)**: The managed Kubernetes service provided by Google Cloud Platform (GCP). It is used to deploy, manage, and scale containerized applications using Google's infrastructure.

2. **Bucket Storage**: Google Cloud Storage is used to store the application's backend data. The data is stored in buckets, which are essentially containers for your data.

3. **ArgoCD**: A declarative, GitOps continuous delivery tool for Kubernetes. It is deployed in the GKE cluster to manage deployments directly from Git repositories.

4. **Prometheus**: An open-source monitoring system with a dimensional data model, flexible query language, efficient time series database, and modern alerting approach. It is deployed in the GKE cluster for real-time monitoring and analytics of the application and the underlying infrastructure.

### Methodology for Provisioning Infrastructure in the Cloud

The approach for provisioning infrastructure involves several steps:

1. **Infrastructure as Code (IaC)**: This is a key principle in the DevOps practice, where infrastructure is provisioned and managed using code and software development techniques, such as version control and continuous integration. Terraform is used as the IaC tool that allows building, changing, and version-controlling infrastructure efficiently.

2. **Automated Deployment**: The deployment of the infrastructure is automated using Terraform, which allows for a more efficient, error-free, and repeatable deployment process. This automation ensures that the infrastructure can be quickly provisioned and torn down as needed.

3. **Version Control**: All the infrastructure code is stored in a version control system (Git), allowing for tracking changes, rollback to previous versions if needed, and collaboration among team members.

4. **Separation of Concerns**: The infrastructure is divided into separate components (e.g., GKE cluster, storage, ArgoCD, Prometheus), each managed in its own directory. This makes the codebase easier to manage and understand.

5. **Configuration Management**: The configuration for each component is managed as code, ensuring that the configuration is documented, version-controlled, and can be reproduced at any time.

