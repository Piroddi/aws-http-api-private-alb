resource "aws_cloudwatch_log_group" "main" {
  name = "apigateway-${var.name}-logs"
  tags = var.tags
}