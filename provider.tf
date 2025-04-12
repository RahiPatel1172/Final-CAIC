# AWS Provider Configuration
# Created by: Rahi Patel (8975566)
# PROG 8870 Final Project
# Date: April 2024

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  region = var.region
}

# Metadata
locals {
  project_name    = "PROG8870-RahiPatel"
  student_name    = "Rahi Patel"
  student_id      = "8975566"
  creation_date   = "2025-04-05"
  environment     = "Dev"
}