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