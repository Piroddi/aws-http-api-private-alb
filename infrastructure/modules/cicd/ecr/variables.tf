variable "scan" {
  type = bool
  description = "Enable/disable ECR image vulnerability scan when push new images"
  default = true
}

variable "name" {
  type = string
  description = "Name of the image repo"
}

variable "tags" {
 type = map(string)
  description = "Common tags applied to ecr image"
}
