resource "aws_lb_target_group" "app" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance"

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "8000"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-tg"
  }
}

resource "aws_lb_target_group_attachment" "app" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.app.arn
  target_id        = var.instance_ids[count.index]
  port             = 8000
}

resource "aws_lb" "app" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.alb_security_group_id]
  subnets         = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn = aws_lb_target_group.app.arn
      }
    }
  }
}