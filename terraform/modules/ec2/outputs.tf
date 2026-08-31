output "instance_ids" {
  description = "IDs of the application EC2 instances"
  value       = aws_instance.this[*].id
}

output "private_ips" {
  description = "Private IP addresses of the application EC2 instances"
  value       = aws_instance.this[*].private_ip
}