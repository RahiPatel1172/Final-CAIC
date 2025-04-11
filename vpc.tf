# VPC Configuration for AWS Infrastructure
# Created by: Rahi Patel (8975566)
# PROG 8870 Final Project
# Date: April 2024

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "rp-vpc"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
  }
}

# Public subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name        = "rp-public-subnet"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "rp-igw"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
  }
}

# Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "rp-public-rt"
    Project     = "PROG8870-RahiPatel"
    Owner       = "Rahi Patel"
    StudentID   = "8975566"
  }
}

# Route table association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
} 