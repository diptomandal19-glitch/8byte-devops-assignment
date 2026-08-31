variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "image_tag_mutability" {
  description = "Whether ECR image tags can be overwritten"
  type        = string
  default     = "MUTABLE"
}