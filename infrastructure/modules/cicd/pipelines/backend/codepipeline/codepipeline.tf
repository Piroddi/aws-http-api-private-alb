resource "aws_codepipeline" "main" {
  name = "${var.codepipeline_name}-${var.env}"
  role_arn = aws_iam_role.codepipeline.arn

  artifact_store {
    location = var.S3_bucket_name
    type = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        Owner                = var.github_org
        Repo                 = var.repository_name
        PollForSourceChanges = "false"
        Branch               = var.branch_name
        OAuthToken           = var.github_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name = "Build"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version = "1"

      configuration = {
        ProjectName   = var.codebuild_project_name
        PrimarySource = "SourceArtifact"


        EnvironmentVariables = jsonencode([
          {
            name = "ENV"
            value = var.env
            type = "PLAINTEXT"
          },
          {
            name = "ECR_REPO"
            value = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.ecr_repo}"
          }
        ])
      }
      run_order = 2
    }
  }

  dynamic "stage" {
    for_each = var.env == "prod" ? [true] : []
    content {
      name = "Approve"
      action {
        category = "Approval"
        name = "Approval"
        owner = "AWS"
        provider = "Manual"
        version = "1"

        configuration = {
          NotificationArn = aws_sns_topic.codepipeline_approval.arn
          CustomData = "approval request for ${var.codepipeline_name} ${var.env}"
        }
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      category = "Deploy"
      name = "Deploy"
      owner = "AWS"
      provider = "ECS"
      input_artifacts = ["BuildArtifact"]
      version = "1"
      configuration =  {
        ClusterName = "helloworld-${var.env}"
        ServiceName = var.ecs_service_name
      }
    }
  }

}