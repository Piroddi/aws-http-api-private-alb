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
}

resource "aws_apigatewayv2_api_mapping" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  domain_name = aws_apigatewayv2_domain_name.main.id
  stage       = aws_apigatewayv2_stage.main.id
}

resource "aws_api_gateway_authorizer" "main" {
  name = "cognito-authorizer-${var.env}"
  rest_api_id = aws_apigatewayv2_api.main.id
  type = "COGNITO_USER_POOLS"
  identity_source = "method.request.header.Authorization"
  provider_arns = ["arn:aws:cognito-idp:eu-west-1:686410090828:userpool/${var.user_pool_id}"]
}






