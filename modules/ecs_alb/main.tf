
resource "aws_lb" "alb" {
  name               = "alb-${var.name}-${var.env}"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.private_subnet_ids

  security_groups = [var.alb_security_group]

  enable_deletion_protection = false

  tags = var.tags
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.app_port
  protocol    = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "application/json"
      message_body = "No path to route"
      status_code  = "404"
    }
  }
}