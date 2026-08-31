variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "staging"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "8byte-devops"
}

variable "vpc_cidr" {
  description = "CIDR block for the staging VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_name" {
  description = "Staging PostgreSQL database name"
  type        = string
  default     = "bookstore"
}

variable "database_username" {
  description = "Staging PostgreSQL username"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Staging PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "rds_instance_class" {
  description = "Staging RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Staging RDS storage in GB"
  type        = number
  default     = 20
}

variable "rds_backup_retention_period" {
  description = "Staging RDS backup retention in days"
  type        = number
  default     = 7
}

variable "ec2_ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  description = "Staging EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_instance_count" {
  description = "Number of staging application instances"
  type        = number
  default     = 2
}