output "vpc_id" {
  description = "Staging VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Staging public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Staging private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = module.security_groups.alb_security_group_id
}

output "app_security_group_id" {
  description = "Application security group ID"
  value       = module.security_groups.app_security_group_id
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = module.security_groups.rds_security_group_id
}

output "db_instance_id" {
  description = "Staging RDS instance ID"
  value       = module.rds.db_instance_id
}

output "db_endpoint" {
  description = "Staging PostgreSQL endpoint"
  value       = module.rds.db_endpoint
}

output "db_port" {
  description = "Staging PostgreSQL port"
  value       = module.rds.db_port
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "ecr_repository_name" {
  description = "ECR repository name"
  value       = module.ecr.repository_name
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.alb.alb_dns_name
}