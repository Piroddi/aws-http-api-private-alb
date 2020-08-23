output vpc_arn {
  value = aws_vpc.custom_vpc.arn
  description = "ARN of newly created vpc"
}

output vpc_id {
  value = aws_vpc.custom_vpc.id
  description = "Id of newly created vpc"
}

output private_subnet_ids {
  value = aws_subnet.private_subnet.*.id
  description = "Id's of newly created subents for vpc"
}

output "vpc_cidr" {
  value = aws_vpc.custom_vpc.cidr_block
  description = "cidr range fot new vpc"
}

output "alb_sg" {
  value = aws_security_group.lb.id
  description = "Security group that will get attached to the ALB"
}

output "ecs_taks_sg" {
  value = aws_security_group.ecs_tasks.id
  description = "Security group that will get attached to the ecs tasks"
}

