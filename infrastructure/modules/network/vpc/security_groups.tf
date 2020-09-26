# ECS Security group
resource "aws_security_group" "ecs_tasks" {
  name        = "ecs-task-sg-${var.env}"
  description = "security group for ecs tasks"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = "8000"
    to_port     = "9000"
    security_groups = [aws_security_group.lb.id]
  }

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 8080
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# NLB Security group
resource "aws_security_group" "lb" {
  name        = "nlb-sg-${var.env}"
  description = "NLB security group"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
