locals {
  common_tags = merge(var.tags, {
    name = var.pipeline_name
    deployed_by = "Terraform"
    env = var.env
  }
  )
}

module "kms" {
  source = "kms"
  env = var.env
  kms_key_name = var.pipeline_name
}

module "s3" {
  s3_bucket_name = var.pipeline_name
  source = "s3"
  env = var.env
  tags = local.common_tags
}

module "codebuild" {
  source = "codebuild"

  buildspec = var.buildspec_location
  codebuild_compute_type = "BUILD_GENERAL1_MEDIUM"
  codebuild_image = "aws/codebuild/standard:4.0"
  codebuild_project_name = var.pipeline_name
  env = var.env
  kms_key_arn = module.kms.kms_key_arn
  tags = local.common_tags
}

module "codepipeline" {
  source = "codepipeline"

  S3_bucket_name = module.s3.s3_bucket_id
  branch_name = var.branch_name
  codebuild_project_name = module.codebuild.codebuild_name
  codepipeline_name = var.pipeline_name
  env = var.env
  github_org = "Command-Quality"
  github_token = jsondecode(data.aws_secretsmanager_secret_version.github_token.secret_string)["github_token"]
  kms_key_arn = module.kms.kms_key_arn
  repository_name = var.repository_name
  tags = local.common_tags
  ecs_service_name = var.ecs_service_name
}
