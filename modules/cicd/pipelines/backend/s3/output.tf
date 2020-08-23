output "s3_bucket_id" {
  value = aws_s3_bucket.main.id
  description = "Id of S3 bucket that's used in pipeline to store artifacts"
}