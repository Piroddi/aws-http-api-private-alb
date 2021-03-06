# GitHub secret
data "aws_secretsmanager_secret" "github_secret" {
  name = var.github_secret
}

data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = data.aws_secretsmanager_secret.github_secret.id
}