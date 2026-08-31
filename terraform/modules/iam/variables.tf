variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "secret_arn" {
  description = "ARN of the database credentials secret"
  type        = string
}