
resource "aws_s3_bucket" "main" {
  bucket = replace("${var.s3_bucket_name}-${var.env}-artifacts", "_" ,"-")
  acl = "private"
  region = data.aws_region.current.id

  versioning {
    enabled = true
  }
  tags = var.tags
}

resource "aws_s3_bucket_policy" main {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" main {
  statement {
    sid = "DenyUnEncryptedObjectUploads"
    effect = "Deny"
    actions = ["s3:PutObject"]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = ["${aws_s3_bucket.main.arn}/*"]
    condition {
      test = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption"
      values = ["aws:kms"]
    }
  }

  statement {
    sid = "DenyInsecureConnections"
    effect = "Deny"
    actions = ["s3:*"]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = ["${aws_s3_bucket.main.arn}/*"]
    condition {
      test = "Bool"
      variable = "aws:SecureTransport"
      values = ["false"]
    }
  }
}