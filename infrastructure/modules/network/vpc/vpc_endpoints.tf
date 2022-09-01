# ECR
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id       = aws_vpc.custom_vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private_subnet.*.id

  security_group_ids = [aws_security_group.ecs_tasks.id]

  tags = {
    Name = "ECR Docker VPC Endpoint Interface - ${var.env}"
    Environment = var.env
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id       = aws_vpc.custom_vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private_subnet.*.id

  security_group_ids = [aws_security_group.ecs_tasks.id]

  tags = {
    Name = "ECR API VPC Endpoint Interface - ${var.env}"
    Environment = var.env
  }
}

# CloudWatch
resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id       = aws_vpc.custom_vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids          =  aws_subnet.private_subnet.*.id
  private_dns_enabled = true
  security_group_ids = [aws_security_group.ecs_tasks.id]

  tags = {
    Name = "CloudWatch VPC Endpoint Interface - ${var.env}"
    Environment = var.env
  }
}

# S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.custom_vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [aws_vpc.custom_vpc.default_route_table_id]

  tags = {
    Name = "S3 VPC Endpoint Gateway - ${var.env}"
    Environment = var.env
  }
}

