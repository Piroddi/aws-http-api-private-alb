variable "name" {
  type = string
  description = "The name of the microservice"
}
variable "env" {
  type = string
  description = "The environment where microservice is being deployed"
}

variable "vpc_id" {
  type = string
  description = "The vpc_id of the deployment environment"
}
variable "vpc_cidr_block" {
  type = string
  description = "Cidr range for the selected vpc"
}

variable "app_image" {
  type = string
  description = "The ecr docker image uri for the microservice"
}

variable "app_port" {
  type = number
  description = "The port number microservice is listening on."
  #TODO: Port must be between 8000-9000
}

variable "fargate_cpu" {
  type = number
  description = "The amount of cpu to attach to microservice"
  #TODO: Valid values are: 256,512,1024,2048,4096
}
variable "fargate_memory" {
  type = number
  description = "The amount of memory needed for microservice. Values must match equivalent cpu value"
  #TODO: Valid values are: 512,1024,2048,4096-16384,8192-30720
}

variable "ecs_min_tasks" {
  type = number
  description = "Minimum number if containers running for microservice"
}

variable "ecs_max_tasks" {
  type = number
  description = "Maximum number if containers running for microservice"
}

variable "cluster_name" {
  type = string
  description = "Name of ecs cluster where microservices will be deployed"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List of the private subents in the vpc"

}

variable "ecs_security_group_id" {
  type = string
  description = "Security group for ALB. Which traffic is allowed to connect to ALB"
}

variable "alb_listner_arn" {
  type = string
  description = "The arn of the alb listener. Ecs service will attach target group to this listener"
}

variable "alb_route_path" {
  type = string
  description = "The path used on alb listener rule to route traffic to correct microservice. Microservice cant run as root context '/'"
}

variable "tags" {
  type = map(string)
  description = "List of tags to attach to microservice resources"
}

variable "alb_listner_priority" {
 type = string
  description = "The priority for alb listener"
}