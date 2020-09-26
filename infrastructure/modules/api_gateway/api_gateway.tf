resource "aws_apigatewayv2_api" "main" {
  name = "${var.name}-${var.env}"
  protocol_type = "HTTP"
  description = "Proxy entry point to ALB Backend"
  tags = var.tags
}

resource "aws_apigatewayv2_route" "main" {
  api_id = aws_apigatewayv2_api.main.id
  route_key = "ANY /{proxy+}"
  target = "integrations/${aws_apigatewayv2_integration.main.id}"
  authorization_type = "JWT"
  authorizer_id = aws_apigatewayv2_authorizer.main.id
}

resource "aws_apigatewayv2_integration" "main" {
  api_id = aws_apigatewayv2_api.main.id
  integration_type = "HTTP_PROXY"
  connection_id = aws_apigatewayv2_vpc_link.main.id
  connection_type = "VPC_LINK"
  integration_method = "ANY"
  integration_uri = var.alb_lister_arn
}

resource "aws_apigatewayv2_stage" "main" {
  api_id = aws_apigatewayv2_api.main.id
  name   = "$default"
  auto_deploy = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.main.arn
    format = "$context.requestId $context.apiId $context.authorizer.error $context.authorizer.latency $context.authorizer.status $context.domainName $context.error.message $context.httpMethod"
  }

}

resource "aws_apigatewayv2_api_mapping" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  domain_name = aws_apigatewayv2_domain_name.main.id
  stage       = aws_apigatewayv2_stage.main.id
}

resource "aws_apigatewayv2_authorizer" "main" {
  api_id           = aws_apigatewayv2_api.main.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name = "cognito-authorizer-${var.env}"

  jwt_configuration {
    audience = [var.client_id]
    issuer   = "https://cognito-idp.eu-west-1.amazonaws.com/${var.user_pool_id}"
  }
}




