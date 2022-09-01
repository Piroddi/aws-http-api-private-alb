resource "aws_ecs_cluster" "main" {
  name = "containers-${var.env}"
  tags = var.tags
}