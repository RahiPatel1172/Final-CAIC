# S3 bucket for storing Terraform state
# Created by: Rahi Patel (8975566)

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-rp-8975566"
  force_destroy = false

  lifecycle {
    ignore_changes  = all
  }

  tags = {
    Name        = "terraform-state-rp-8975566"
    Environment = "Dev"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
    Project     = "PROG8870-RahiPatel"
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  lifecycle {
    ignore_changes  = all
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-lock"
    Environment = "Dev"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
    Project     = "PROG8870-RahiPatel"
  }
} 