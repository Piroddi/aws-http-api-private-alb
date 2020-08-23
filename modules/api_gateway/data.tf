data "aws_acm_certificate" "issued" {
  domain   = "api.${var.route53_domain}"
  statuses = ["ISSUED"]
}


data "aws_route53_zone" "wamly-hosted-zone" {
  name         = var.route53_domain
  private_zone = false
}
