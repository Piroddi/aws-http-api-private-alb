variable "name" {
  type        = string
  description = "The name of the Api Gateway http api"
}

variable "env" {
  type = string
  description = "The http api environment"
}

variable "vpc_link_sg_ids" {
  type = string
  description = "List of security groups, that control access throug the VPC link"
}
variable "private_subnets" {
  type = list(string)
  description = "List of private subnets to attach to vpc link"
}

variable "alb_lister_arn" {
  type = string
  description = "The arn of the Application load balancer to route requests to"
}

variable "route53_domain" {
  type = string
  description = "The Route53 main, that will be attached to api gateway with subdomain of api."
}

variable "tags" {
  type = map(string)
  description = "Map of tags to associated with api gateway"
}