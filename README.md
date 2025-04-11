# AWS Infrastructure Automation with Terraform

This project deploys a scalable AWS infrastructure using Terraform, implementing Infrastructure as Code (IaC) principles.

## Project Overview

This Terraform configuration was developed by Rahi Patel (Student ID: 8975566) for PROG 8870 Final Project. It deploys the following AWS resources:

- S3 bucket for Terraform state storage with versioning enabled
- DynamoDB table for state locking
- Custom VPC with a public subnet
- Internet Gateway and Route Table
- EC2 instance with Apache web server
- Security Group allowing SSH (22), HTTP (80), and HTTPS (443) traffic

## Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- [Terraform](https://www.terraform.io/downloads.html) installed (version 1.0.0+)
- AWS account with appropriate permissions

## Project Structure

```
.
├── main.tf           # Main Terraform configuration file
├── variables.tf      # Variable declarations
├── terraform.tfvars  # Variable values
├── provider.tf       # AWS provider configuration
├── backend.tf        # Terraform backend configuration
├── s3.tf             # S3 bucket and DynamoDB resources
├── vpc.tf            # VPC and networking resources
├── ec2.tf            # EC2 instance and security group
└── README.md         # Project documentation
```

## Getting Started

### Initial Setup

For the first-time setup, you need to create the S3 bucket and DynamoDB table before using them as a backend:

1. Comment out the backend configuration in `backend.tf`:

```hcl
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-caic-project"
#     key            = "terraform/statefile.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"
#   }
# }
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the configuration to create the S3 bucket and DynamoDB table:

```bash
terraform plan
terraform apply
```

4. Uncomment the backend configuration in `backend.tf`.

5. Reinitialize Terraform to use the S3 backend:

```bash
terraform init
```

### Subsequent Deployments

For subsequent deployments, you can directly run:

```bash
terraform init
terraform plan
terraform apply
```

## Accessing the Web Server

Once the infrastructure is deployed, you can access the web server in two ways:

1. **Via Web Browser**:
   - Get the public IP of your EC2 instance using:
     ```bash
     terraform output web_server_public_ip
     ```
   - Open a web browser and navigate to: `http://<public-ip>`
   - You should see a welcome page with server information

2. **Via SSH**:
   - Use the following command to SSH into the instance:
     ```bash
     ssh -i <your-key-pair.pem> ec2-user@<public-ip>
     ```
   - Replace `<your-key-pair.pem>` with your key pair file
   - Replace `<public-ip>` with your instance's public IP

## Testing Procedures

1. **Web Server Test**:
   - Access the web server URL
   - Verify the welcome page loads
   - Check that all server information is displayed correctly

2. **Security Test**:
   - Verify SSH access (port 22)
   - Verify HTTP access (port 80)
   - Verify HTTPS access (port 443)
   - Verify outbound internet access

3. **Infrastructure Test**:
   - Verify VPC and subnet configuration
   - Check route table and internet gateway
   - Validate security group rules
   - Test S3 bucket access and versioning
   - Verify DynamoDB table for state locking

## Configuration Customization

Update the `terraform.tfvars` file to customize your deployment:

```hcl
region              = "us-east-1"
ami_id              = "ami-06db4d78cb1d3bbf9"  # Amazon Linux 2 AMI
instance_type       = "t2.micro"
vpc_cidr            = "10.0.0.0/16"
subnet_cidr         = "10.0.1.0/24"
bucket_name         = "terraform-state-rp-8975566"
state_file_key      = "terraform/statefile.tfstate"
dynamodb_table_name = "terraform-lock"
```

## Clean Up

To destroy all resources created by Terraform:

```bash
terraform destroy
```

## Security Considerations

- The S3 bucket is configured with versioning to track changes to the state file
- DynamoDB is used for state locking to prevent concurrent modifications
- Security groups are configured to allow only necessary traffic
- Remember to secure your `terraform.tfvars` file as it may contain sensitive information
- Web server is configured with basic security best practices

## Best Practices Implemented

- **Modularity**: Resources are organized into separate files by function
- **Variable Usage**: All configurable parameters are defined as variables
- **State Management**: Remote state storage with locking and versioning
- **Security**: Restricted network access with security groups
- **Documentation**: Comprehensive README with setup and testing instructions

## Contributors

- Rahi Patel - 8975566 