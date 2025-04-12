# PROG 8870 - AWS Infrastructure with Terraform
By: Rahi Patel (8975566)

## What I Built
I created an AWS infrastructure using Terraform that includes:
- A VPC with a public subnet
- EC2 instance running a web server
- S3 bucket for storing Terraform state
- DynamoDB table for state locking

## How to Run This Project

1. Make sure you have:
   - AWS CLI installed
   - Terraform installed
   - AWS Academy credentials

2. Clone this repository and run:
```bash
terraform init
terraform apply
```

3. To access the web server:
   - Get the IP: `terraform output web_server_public_ip`
   - Open in browser: `http://<public-ip>`
   - SSH access: `ssh -i keys/rp-key-pair.pem ec2-user@<public-ip>`

## Project Files
- `main.tf` - Main configuration
- `variables.tf` - All my variables
- `terraform.tfvars` - Variable values
- `vpc.tf` - VPC and network setup
- `ec2.tf` - EC2 and security group
- `s3.tf` - S3 bucket configuration
- `backend.tf` - Terraform state configuration

## What I Learned
- How to use Terraform with AWS
- Setting up a VPC and EC2 instance
- Managing infrastructure as code
- Using S3 for state management
- Implementing security best practices

## Challenges I Faced
1. Setting up the S3 backend correctly
2. Managing SSH keys securely
3. Configuring security groups properly

## Testing
1. Web Server:
   - Visit `http://<public-ip>`
   - Should see my custom welcome page

2. SSH Access:
   - Use the key in `keys/rp-key-pair.pem`
   - Connect with `ssh -i keys/rp-key-pair.pem ec2-user@<public-ip>`

## Clean Up
To remove everything:
```bash
terraform destroy
```

## Resources Used
- AWS Free Tier
- Terraform Documentation
- AWS Documentation
- Class Notes

## Tags
All resources are tagged with:
- Name
- Owner: Rahi Patel
- StudentID: 8975566
- Project: PROG8870-RahiPatel 