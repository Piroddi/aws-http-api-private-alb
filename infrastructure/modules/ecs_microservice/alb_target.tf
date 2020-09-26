resource "aws_lb_target_group" "alb_tg" {

  name        = "${var.name}-tg"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = "${var.alb_route_path}/actuator/health"
    port = var.app_port
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = var.alb_listner_arn
  priority     = var.alb_listner_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }

  condition {
    path_pattern {
      values = ["${var.alb_route_path}/*"]
    }
  }
}