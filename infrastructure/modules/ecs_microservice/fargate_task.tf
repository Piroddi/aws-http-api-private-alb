data "aws_region" "current" {}

resource "aws_ecs_task_definition" "app" {
  family             = "${var.name}-${var.env}"
  execution_role_arn = aws_iam_role.main_ecs_tasks.arn
  task_role_arn      = aws_iam_role.task_role.arn
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu    = var.fargate_cpu
  memory = var.fargate_memory
  container_definitions = jsonencode([
    {
      name : var.name,
      image : var.app_image,
      cpu : var.fargate_cpu,
      memory : var.fargate_memory,
      networkMode : "awsvpc",
      logConfiguration : {
        logDriver : "awslogs",
        "options" : {
          "awslogs-group" : aws_cloudwatch_log_group.cw_log_group.name,
          "awslogs-region" : data.aws_region.current.name
          "awslogs-stream-prefix" : "ecs"
        }
      },
      portMappings : [
        {
          containerPort : var.app_port
          protocol : "tcp",
          hostPort : var.app_port
        }
      ],
      environment : [
        {
          name : "ENV",
          value : var.env
        }
      ]
    }
  ])
  tags = var.tags
}