#!/bin/bash

# Exit if any command fails
set -e

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

echo "Checking Terraform format..."
terraform fmt -check

# Plan Terraform destruction
echo "Planning Terraform resource destruction..."
terraform plan -destroy -out=tfplan

# Apply Terraform destruction
echo "Destroying Terraform-managed infrastructure..."
terraform apply -auto-approve tfplan

echo "All resources have been destroyed successfully!"
