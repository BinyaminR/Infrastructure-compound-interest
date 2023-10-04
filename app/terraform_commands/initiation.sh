#!/bin/bash

# Define a function to print steps in a noticeable way
print_step() {
    echo ""
    echo "##############################################################################"
    echo "# $1"
    echo "##############################################################################"
}

# Define a function to check the success of the previous command
check_success() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1"
    else
        echo "[ERROR] Failed to $1"
        exit 1
    fi
}

# Step 1: Get GKE credentials
print_step "Step 1: Getting GKE credentials..."
gcloud container clusters get-credentials binyamin-app --zone us-west1-a --project bootcamp-project-gke
check_success "retrieve GKE credentials"

# Step 2: Run Terraform Initialization
print_step "Step 2: Initializing Terraform..."
terraform init
check_success "initialize Terraform"

# Step 3: Plan Terraform Configurations
print_step "Step 3: Planning Terraform configurations..."
terraform plan
check_success "plan Terraform configurations"

# Step 4: Apply Terraform Configurations
print_step "Step 4: Applying Terraform configurations..."
terraform apply -auto-approve
check_success "apply Terraform configurations"

echo ""
echo "All steps completed successfully!"
