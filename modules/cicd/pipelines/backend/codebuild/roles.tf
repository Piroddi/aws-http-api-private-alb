resource "aws_iam_role" "codebuild" {
  name = "codebuild_${var.codebuild_project_name}_${var.env}_role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume.json
  tags = var.tags
}

resource "aws_iam_policy" "codebuild" {
  name = "codebuild_${var.codebuild_project_name}_${var.env}_policy"
  description = "Allow codebuild deployments"
  policy = data.aws_iam_policy_document.codebuild.json
}

resource "aws_iam_role_policy_attachment" "codebuild" {
  role       = aws_iam_role.codebuild.name
  policy_arn = aws_iam_policy.codebuild.arn
}

data "aws_iam_policy_document" "codebuild_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codebuild" {
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
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs",
      "ec2:CreateNetworkInterfacePermission"
    ]

    resources = ["*"]
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
      "codebuild:UpdateReportGroup",
      "codebuild:ListReportsForReportGroup",
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:ListReports",
      "codebuild:DeleteReport",
      "codebuild:ListReportGroups",
      "codebuild:BatchPutTestCases",
      "codecommit:CancelUploadArchive",
      "codecommit:GetBranch",
      "codecommit:GetCommit",
      "codecommit:GetUploadArchiveStatus",
      "codecommit:UploadArchive"
    ]

    resources = [
      "arn:aws:codebuild:eu-west-1:${data.aws_caller_identity.current.account_id}:project/codebuild_${var.codebuild_project_name}*",
      "arn:aws:codebuild:eu-west-1:${data.aws_caller_identity.current.account_id}:report-group/codebuild_${var.codebuild_project_name}*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy"
    ]

    resources = ["*"]

  }

}