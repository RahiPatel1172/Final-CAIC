# AWS Infrastructure Demo Script
## PROG 8870 - Rahi Patel (8975566)

### 1. Introduction (2 minutes)
- Brief overview of the project
- Infrastructure components to be demonstrated
- Tools used (Terraform, AWS CLI)

### 2. Infrastructure Overview (3 minutes)
- VPC with public subnet
- EC2 instance with web server
- S3 bucket for state management
- DynamoDB for state locking
- Security groups and networking

### 3. Live Demo Steps

#### Step 1: Show Current Infrastructure (3 minutes)
```bash
# Show current EC2 instance
aws ec2 describe-instances --filters "Name=tag:Name,Values=rp-web-server" --query 'Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress,Tags[?Key==`Name`].Value|[0]]' --output table

# Show S3 bucket
aws s3 ls | grep terraform-state-rp-8975566

# Show DynamoDB table
aws dynamodb list-tables
```

#### Step 2: Demonstrate Web Server (2 minutes)
- Open web browser and show the welcome page
- Explain the custom HTML page and its purpose
- Show server information displayed

#### Step 3: Show Terraform Configuration (5 minutes)
- Explain main.tf structure
- Show provider configuration
- Explain variables and their usage
- Show resource definitions
- Explain state management with S3 and DynamoDB

#### Step 4: Demonstrate Infrastructure Changes (5 minutes)
```bash
# Make a change to the web server configuration
terraform plan

# Apply the changes
terraform apply -auto-approve

# Verify the changes
curl http://<instance-ip>
```

#### Step 5: Cleanup and Conclusion (2 minutes)
```bash
# Show how to destroy infrastructure (if needed)
terraform destroy
```

### 4. Key Points to Highlight
1. Infrastructure as Code benefits
2. State management best practices
3. Security considerations
4. Cost optimization
5. Tagging and organization

### 5. Common Questions to Prepare For
1. Why use Terraform instead of AWS Console?
2. How does state management work?
3. What are the security best practices implemented?
4. How can this be scaled?
5. What are the cost implications?

### 6. Troubleshooting Tips
1. If web server is not accessible:
   - Check security group rules
   - Verify instance status
   - Check network ACLs

2. If Terraform apply fails:
   - Check AWS credentials
   - Verify resource limits
   - Check for existing resources

3. If state file issues:
   - Verify S3 bucket access
   - Check DynamoDB table
   - Verify IAM permissions

### 7. Backup Plan
1. Have screenshots ready
2. Prepare a recorded demo
3. Have infrastructure diagrams ready
4. Keep AWS Console open as backup

### 8. Time Management
- Total demo time: ~20 minutes
- Leave 5 minutes for Q&A
- Keep each section within time limits
- Have a timer ready

### 9. Final Checklist
- [ ] AWS credentials configured
- [ ] Terraform initialized
- [ ] All resources accessible
- [ ] Web server running
- [ ] Demo script printed
- [ ] Backup materials ready
- [ ] Timer set up
- [ ] Q&A notes prepared 