# Backend Configuration for AWS Terraform Project
# Created by: Rahi Patel (8975566)
# PROG 8870 Final Project
# Date: April 2024

# Using local backend for demonstration purposes
# In a production environment, you would use an S3 backend as commented below
terraform {
  backend "s3" {
    bucket         = "terraform-state-rp-8975566"
    key            = "terraform/statefile.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

# Production S3 backend configuration (commented out)
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-rp-8975566"
#     key            = "terraform/statefile.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"
#   }
# } 