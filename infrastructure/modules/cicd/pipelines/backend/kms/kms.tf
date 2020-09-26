resource "aws_kms_key" "main" {
  description = "Encrption key used for the ${var.kms_key_name}-${var.env}"
}