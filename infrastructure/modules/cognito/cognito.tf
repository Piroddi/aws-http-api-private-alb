resource "aws_cognito_user_pool" "pool" {
  name = var.cognito_user_pool_name
  tags = var.tags
}

resource "aws_cognito_resource_server" "resource" {
  identifier = "https://api.${var.domain}"
  name       = var.domain
  user_pool_id = aws_cognito_user_pool.pool.id
  scope {
    scope_name        = "services.read"
    scope_description = "Access to read dummy backend services"
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name = "client"
  user_pool_id = aws_cognito_user_pool.pool.id
  generate_secret = true
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = ["client_credentials"]
  allowed_oauth_scopes = aws_cognito_resource_server.resource.scope_identifiers
}

resource "aws_cognito_user_pool_domain" "main" {
  domain          = "auth.piroddi.co.za"
  #Had to hardcode cert arn, as cert has to be in us-east-1 region
  certificate_arn = "arn:aws:acm:us-east-1:816070112642:certificate/d8a85243-71e7-46b4-a3d8-e9bda69807f6"
  user_pool_id    = aws_cognito_user_pool.pool.id
}

data "aws_route53_zone" "example" {
  name = var.domain
}

resource "aws_route53_record" "auth-cognito-A" {
  name    = aws_cognito_user_pool_domain.main.domain
  type    = "A"
  zone_id = data.aws_route53_zone.example.zone_id
  alias {
    evaluate_target_health = false
    name                   = aws_cognito_user_pool_domain.main.cloudfront_distribution_arn
    # This zone_id is fixed
    zone_id = "Z2FDTNDATAQYW2"
  }
}