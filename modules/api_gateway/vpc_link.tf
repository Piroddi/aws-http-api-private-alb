resource "aws_apigatewayv2_vpc_link" "main" {
  name = "wamly-private-link"
  security_group_ids = [var.vpc_link_sg_ids]
  subnet_ids = var.private_subnets
}