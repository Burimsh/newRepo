#!/bin/bash
# Terraform Lab - Local File Resource

echo "🔹 Starting Lab - Terraform Local File Lab"

# Initialize Terraform
terraform init

# Plan
terraform plan

# Apply
terraform apply -auto-approve

# Show file content
echo "🔹 File created:"
cat hello.txt

echo "🔹 Lab complete. To clean resources, run:"
echo "terraform destroy -auto-approve"

