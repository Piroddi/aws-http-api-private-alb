
resource "aws_iam_role" "codepipeline" {
  name = "codepipeline_${var.codepipeline_name}_role_${var.env}"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume.json
  tags = var.tags
}

resource "aws_iam_policy" "codepipeline" {
  name = "codepipeline_${var.codepipeline_name}_policy_${var.env}"
  description = "Allow Codepipeline deployments"
  policy = data.aws_iam_policy_document.codepipeline.json
}

resource "aws_iam_role_policy_attachment" "codepipeline" {
  role       = aws_iam_role.codepipeline.name
  policy_arn = aws_iam_policy.codepipeline.arn
}

resource "aws_iam_role_policy_attachment" "codepipeline_deployecs_policy" {
  role       = aws_iam_role.codepipeline.name
  policy_arn = data.aws_iam_policy.AWSCodeDeployRoleForECS.arn
}

data "aws_iam_policy_document" "codepipeline_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codepipeline" {
  statement {
    effect = "Allow"

    actions = [
      "kms:*"
    ]

    resources = [var.kms_key_arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "codecommit:CancelUploadArchive",
      "codecommit:GetBranch",
      "codecommit:GetCommit",
      "codecommit:GetUploadArchiveStatus",
      "codecommit:UploadArchive"
    ]

    resources = [
      "*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:*"
    ]

    resources = [
      "arn:aws:s3:::*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild"
    ]

    resources = [
      "arn:aws:codebuild:eu-west-1:${data.aws_caller_identity.current.account_id}:project/${var.codepipeline_name}*",]
  }

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "iam:PassRole"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "codedeploy:CreateDeployment",
      "codedeploy:GetApplicationRevision",
      "codedeploy:GetApplication",
      "codedeploy:GetDeployment",
      "codedeploy:GetDeploymentConfig",
      "codedeploy:RegisterApplicationRevision",
      "ecs:*"
    ]
    resources =  ["*"]
  }
}
