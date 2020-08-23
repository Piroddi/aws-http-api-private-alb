resource "aws_ecs_cluster" "main" {
  name = "wamly-${var.env}"
  tags = var.tags
}