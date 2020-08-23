data "aws_region" "current" {}

### VPC Network Setup
resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(var.tags,{
    Name = "${var.vpc_tag_name}-${var.env}"
  })
}

# Create the private subnets
resource "aws_subnet" "private_subnet" {
  count = var.number_of_private_subnets
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags,{
    Name = "${var.private_subnet_tag_name}-${var.env}"
  })
}


