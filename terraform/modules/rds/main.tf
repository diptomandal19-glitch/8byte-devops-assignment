resource "aws_db_subnet_group" "this" {
  name = "db-${var.environment}-subnet-group"
  description = "Private subnet group for PostgreSQL RDS"
  subnet_ids  = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier = "db-${var.project_name}-${var.environment}-postgres"

  engine         = "postgres"
  engine_version = "15"

  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true
  max_allocated_storage = 50

  db_name  = var.database_name
  username = var.database_username
  password = var.database_password
  port     = 5432

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.rds_security_group_id]

  publicly_accessible = false

  backup_retention_period = var.backup_retention_period
  backup_window           = "18:00-18:30"
  maintenance_window      = "sun:19:00-sun:19:30"

  auto_minor_version_upgrade = true
  deletion_protection        = false
  skip_final_snapshot        = true

  tags = {
    Name = "${var.project_name}-${var.environment}-postgres"
  }
}