resource "aws_cloudwatch_event_rule" "main" {
  name = "${var.codepipeline_name}-codepipeline"
  description = "CI/CD pipeline status"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.codepipeline"
  ],
  "detail-type": [
    "CodePipeline Pipeline Execution State Change"
  ],
  "resources": [
    "${aws_codepipeline.main.arn}"
  ],
  "detail": {
    "pipeline": [
      "${aws_codepipeline.main.name}"
    ],
    "state": [
      "RESUMED",
      "FAILED",
      "CANCELED",
      "SUCCEEDED",
      "SUPERSEDED",
      "STARTED"
    ]
  }
}
PATTERN

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "main" {

  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.main.arn
  input_path = "$.detail"
}

resource "aws_sns_topic" "main" {
  name         = "codepipeline-${aws_codepipeline.main.name}"
  display_name = "CodePipeline notifications for ${aws_codepipeline.main.name}"
  tags = var.tags
}

resource "aws_sns_topic_policy" "main" {
  arn = aws_sns_topic.main.arn

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "AWSEvents_smebiz-codepipeline-events_SendToSNS",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sns:Publish",
      "Resource": "${aws_sns_topic.main.arn}"
    }
  ]
}
EOF
}

resource "aws_sns_topic" "codepipeline_approval" {
  name         = "approval-${var.codepipeline_name}-${var.env}"
  display_name = "CodePipeline approval notifications for ${var.codepipeline_name}-${var.env}"
  tags = var.tags
}

resource "aws_sns_topic_policy" "codepipeline_approval" {
  arn = aws_sns_topic.codepipeline_approval.arn

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "CodepipelineManualApproval",
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sns:Publish",
      "Resource": "${aws_sns_topic.codepipeline_approval.arn}"
    }
  ]
}
EOF
}
