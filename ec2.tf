# EC2 configuration for PROG 8870 Final Project
# Created by: Rahi Patel (8975566)
# Date: April 2024

# Security group for EC2 instance
resource "aws_security_group" "instance_sg" {
  name        = "rp-instance-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic - Created by Rahi Patel"
  vpc_id      = aws_vpc.main.id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name        = "rp-security-group"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
  }
}

# Create a private key
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "deployer" {
  key_name   = "rp-key-pair"
  public_key = tls_private_key.pk.public_key_openssh
  lifecycle {
    ignore_changes = [public_key]
  }
}

# Save private key locally
resource "local_file" "ssh_key" {
  content         = tls_private_key.pk.private_key_pem
  filename        = "rp-key-pair.pem"
  file_permission = "0600"
}

# EC2 instance
resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  key_name              = aws_key_pair.deployer.key_name
  
  user_data = <<-EOF
              #!/bin/bash
              # Update system packages
              dnf update -y
              
              # Install Apache
              dnf install -y httpd
              
              # Start Apache service
              systemctl start httpd
              systemctl enable httpd
              
              # Create custom index page
              cat <<HTML > /var/www/html/index.html
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Welcome to Rahi's Web Server</title>
                  <style>
                      body {
                          font-family: Arial, sans-serif;
                          margin: 40px;
                          background-color: #f0f0f0;
                      }
                      .container {
                          background-color: white;
                          padding: 20px;
                          border-radius: 10px;
                          box-shadow: 0 0 10px rgba(0,0,0,0.1);
                          max-width: 800px;
                          margin: 0 auto;
                      }
                      h1 {
                          color: #333;
                          text-align: center;
                      }
                      .info {
                          margin-top: 20px;
                          padding: 15px;
                          background-color: #e8f5e9;
                          border-radius: 5px;
                      }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>Welcome to Rahi's AWS Infrastructure</h1>
                      <div class="info">
                          <h2>Server Information:</h2>
                          <p><strong>Student Name:</strong> Rahi Patel</p>
                          <p><strong>Student ID:</strong> 8975566</p>
                          <p><strong>Course:</strong> PROG 8870</p>
                          <p><strong>Server Status:</strong> Running</p>
                      </div>
                  </div>
              </body>
              </html>
              HTML
              EOF
  
  tags = {
    Name        = "rp-web-server"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
    Environment = "Dev"
  }
} 