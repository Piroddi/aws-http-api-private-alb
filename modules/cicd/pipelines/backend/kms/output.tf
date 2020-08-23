output "kms_key_arn" {
  value = aws_kms_key.main.arn
  description = "ARN of KMS key used to encrypt pipelines S3 bucket"
}