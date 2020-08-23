output "codebuild_name" {
  value = aws_codebuild_project.main.name
  description = "Name of codebuild project that builds microservice"
}

output "codebuild_arn" {
  value = aws_codebuild_project.main.arn
  description = "ARN of codebuild project that builds microservice"
}