resource "aws_apigatewayv2_domain_name" "main" {
  domain_name = "api.${var.route53_domain}"

  domain_name_configuration {
    certificate_arn = data.aws_acm_certificate.issued.arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_route53_record" "main" {
  name    = aws_apigatewayv2_domain_name.main.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.wamly-hosted-zone.id

  alias {
    name                   = aws_apigatewayv2_domain_name.main.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.main.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = false
  }
}

