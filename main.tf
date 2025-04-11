# AWS Infrastructure Deployment with Terraform
# Author: Rahi Patel (8975566)
# PROG 8870 Final Project
# Date: April 2024

# Project Structure:
# ├── main.tf           # This file - Main entry point and project documentation
# ├── provider.tf       # AWS provider configuration
# ├── backend.tf        # S3 backend configuration for Terraform state
# ├── variables.tf      # Variable declarations
# ├── terraform.tfvars  # Variable values
# ├── outputs.tf        # Output definitions
# │
# ├── Resource Configurations:
# │   ├── vpc.tf       # VPC, subnet, and networking components
# │   ├── ec2.tf       # EC2 instance and security group
# │   └── s3.tf        # S3 bucket and DynamoDB table for state management
# │
# └── README.md        # Project documentation and setup instructions

# This project implements a complete AWS infrastructure including:
# - VPC with public subnet and internet gateway
# - EC2 instance running a web server
# - S3 bucket for Terraform state storage
# - DynamoDB table for state locking
# - Security groups with proper access rules

# All resources are tagged with:
# - Student Name: Rahi Patel
# - Student ID: 8975566
# - Project: PROG8870-RahiPatel

# This file serves as the main entry point for Terraform configuration

# The actual resources are defined in their respective files:
# - s3.tf: S3 bucket for storing Terraform state
# - vpc.tf: VPC, subnets, and networking components
# - ec2.tf: EC2 instance and security group 