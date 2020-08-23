variable "name" {
  type = string
  description = "The main of application load balancer that will route traffic to ecs tasks"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List of the private subents in the vpc"
}

variable "env" {
  type = string
  description = "Environment that Load Balancer will be associated with"
}

variable "app_port" {
  type = string
  description = "The port the application is listening on"
}

variable "vpc_id" {
  type = string
  description = "The vpc id where resources are being deployed to"
}

variable "alb_security_group" {
  type = string
  description = "Security group for ALB. Which traffic is allowed to connect to ALB"
}

variable "tags" {
  type = map(string)
  description = "Map of tags to associate with ALB"
}