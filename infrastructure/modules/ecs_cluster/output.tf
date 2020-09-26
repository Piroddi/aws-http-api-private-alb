output "aws_ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
  description = "Id of ECS cluster"
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
  description = "Name of ECS cluster"
}