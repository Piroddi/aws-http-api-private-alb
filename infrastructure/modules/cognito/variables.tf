variable "cognito_user_pool_name" {
  type = string
  description = "Name of user pool"
}

variable "tags" {
  type = map(string)
  description = "Map of tags to associated with api gateway"
}

variable "zone_id" {
  type = string
  description = "The hosted zone id of your domain"
}

variable "domain" {
  type = string
  description = "The registered domain name on route53"
}