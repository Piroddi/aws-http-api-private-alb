resource "aws_cognito_user_pool" "pool" {
  name = var.cognito_user_pool_name
}

resource "aws_cognito_user_pool_client" "client" {
  name = "client"

  user_pool_id = aws_cognito_user_pool.pool.id
}

