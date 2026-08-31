resource "aws_instance" "this" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
  vpc_security_group_ids     = [var.app_security_group_id]
  associate_public_ip_address = false

  iam_instance_profile = var.iam_instance_profile

  key_name = var.key_name

  user_data = <<-EOF
            #!/bin/bash
            set -e

            dnf update -y
            dnf install -y docker awscli

            systemctl enable docker
            systemctl start docker

            REGION="${var.aws_region}"
            ECR_REPOSITORY="${var.ecr_repository_url}"

            aws ecr get-login-password --region "$REGION" | \
              docker login --username AWS --password-stdin "$ECR_REPOSITORY"

            docker pull "$ECR_REPOSITORY:latest"

            docker run -d \
              --name fastapi-app \
              --restart unless-stopped \
              -p 8000:8000 \
              "$ECR_REPOSITORY:latest"
            EOF

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-app-${count.index + 1}"
  }
}