variable "pipeline_name" {
  type = string
  description = "The name for reousrces in the pipeline"
}

variable "env" {
  type = string
  description = "The environment of the pipeline"
}

variable "tags" {
  type = map(string)
  description = "A list of tags attached to the pipeline resources"
}

variable "repository_name" {
  type = string
  description = "The name of the repo that the pipeline will pull from"
}

variable "branch_name" {
  type = string
  description = "The branch that the pipeline runs "
}

variable "ecs_service_name" {
  type = string
  description = "The name of the ECS service"
}

variable "github_secret" {
  type = string
  description = "Github secret to access code"
}

variable "buildspec_location" {
  type = string
  description = "location of buildspec"
}