resource "aws_cloudwatch_log_group" "cw_log_group" {
  name              = "/ecs/${var.name}-${var.env}"
  retention_in_days = 30

  tags = var.tags
}

resource "aws_cloudwatch_log_stream" "cw_log_stream" {
  name           = "${var.name}-${var.env}"
  log_group_name = aws_cloudwatch_log_group.cw_log_group.name
}