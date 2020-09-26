resource "aws_ecs_cluster" "main" {
  name = "helloworld-${var.env}"
  tags = var.tags
}