data "aws_caller_identity" "current" {}


data "aws_acm_certificate" "issued" {
  domain   = "*.${var.route53_domain}"
  statuses = ["ISSUED"]
}


data "aws_route53_zone" "wamly-hosted-zone" {
  name         = var.route53_domain
  private_zone = false
}
