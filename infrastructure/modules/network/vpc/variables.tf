variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "availability_zones" {
  type  = list(string)
  description = "List of availability zones for the selected region"
}

variable "number_of_private_subnets" {
  type = number
  default = 2
  description = "The number of private subnets in a VPC"
}

variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.4.0/24"]
  description = "CIDR block range for the private subnets"
}

variable "env" {
  type        = string
  description = "Application environment"
}

variable "tags" {
  type = map(string)
  description = "Map of tags to attach to network resources"
}