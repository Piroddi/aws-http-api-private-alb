resource "aws_codebuild_project" "main" {
  name = "${var.codebuild_project_name}_${var.env}"
  service_role = aws_iam_role.codebuild.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = var.codebuild_compute_type
    image = var.codebuild_image
    type = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type = "CODEPIPELINE"
    buildspec = var.buildspec
  }

  encryption_key = var.kms_key_arn
  tags = var.tags
}