#!/bin/bash

# Navigate to your Terraform directory (optional, if needed)
# cd /path/to/your/terraform/files

# Initialize Terraform (optional, if you haven't done this already or if the Terraform state/configuration has changed)
terraform init

# Destroy all Terraform resources
echo "Destroying all Terraform resources..."
terraform destroy -auto-approve

# Check for any errors in the terraform destroy command
if [ $? -eq 0 ]; then
    echo "Successfully destroyed all Terraform resources."

    # Delete the kubectl context
    echo "Deleting kubectl context..."
    kubectl config delete-context gke_bootcamp-project-gke_us-west1-a_binyamin-app

    if [ $? -eq 0 ]; then
        echo "Successfully deleted the kubectl context."
    else
        echo "Failed to delete the kubectl context."
    fi
else
    echo "Failed to destroy Terraform resources."
fi
