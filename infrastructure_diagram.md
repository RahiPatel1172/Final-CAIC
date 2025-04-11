# AWS Infrastructure Diagram

```
+------------------------------------------+
|               AWS Account                |
+------------------------------------------+
|                                          |
|  +----------------+                      |
|  |     VPC        |                      |
|  | 10.0.0.0/16    |                      |
|  +----------------+                      |
|         |                                |
|         v                                |
|  +----------------+                      |
|  |  Public Subnet |                      |
|  |  10.0.1.0/24   |                      |
|  +----------------+                      |
|         |                                |
|         v                                |
|  +----------------+    +-------------+   |
|  |  EC2 Instance  |    |  S3 Bucket  |   |
|  |  Web Server    |    |  (State)    |   |
|  +----------------+    +-------------+   |
|                                          |
|  +----------------+                      |
|  |  DynamoDB      |                      |
|  |  (State Lock)  |                      |
|  +----------------+                      |
|                                          |
+------------------------------------------+

Components:
1. VPC (Virtual Private Cloud)
   - CIDR: 10.0.0.0/16
   - Public subnet: 10.0.1.0/24
   - Internet Gateway for public access

2. EC2 Instance
   - t2.micro instance type
   - Apache web server
   - Custom welcome page
   - Security group allowing HTTP/SSH

3. S3 Bucket
   - Name: terraform-state-rp-8975566
   - Purpose: Store Terraform state
   - Versioning enabled

4. DynamoDB Table
   - Name: terraform-lock
   - Purpose: State locking
   - Pay-per-request billing

Security:
- Security groups configured
- SSH access restricted
- HTTP/HTTPS access allowed
- Proper tagging implemented 