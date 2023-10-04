#!/bin/bash

# Exit if any command fails
set -e

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

echo "Checking Terraform format..."
terraform fmt -check

# Plan Terraform changes
echo "Planning Terraform configurations..."
terraform plan -input=false

# Apply Terraform changes
echo "Applying Terraform configurations..."
terraform apply -auto-approve

echo "All tasks completed successfully!"
