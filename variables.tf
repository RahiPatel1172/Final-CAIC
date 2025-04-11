# Variables for AWS Infrastructure Terraform Project
# Created by: Rahi Patel (8975566)
# PROG 8870 Final Project
# Date: April 2024

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform state storage"
  type        = string
}

variable "state_file_key" {
  description = "Key for terraform state file in S3"
  type        = string
  default     = "terraform/statefile.tfstate"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
  default     = "terraform-lock"
} 