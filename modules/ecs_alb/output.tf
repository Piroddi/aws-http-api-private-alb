output "alb_dns_name" {
  value = aws_lb.alb.dns_name
  description = "The generic dns name that gets created for ALB"
}

output "alb_arn" {
  value = aws_lb.alb.arn
  description = "ARN of ALB the routes traffics to the different ecs services "
}

output "alb_lister_arn" {
  value = aws_lb_listener.alb_listener.arn
  description = "ARN of ALB listener that gets different rules attached to successfully route traffic to ecs services"
}