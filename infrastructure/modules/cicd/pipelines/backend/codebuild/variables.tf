variable "codebuild_project_name" {
  type = string
  description = "The name of the codebuild project"
}

variable "codebuild_compute_type" {
  type = string
  description = "The EC2 type for codebuild"
}

variable "buildspec" {
  type = string
  description = "The location and name of the codebuild buildspec file"
}

variable "codebuild_image" {
  type = string
  description = "The docker build image used for codebuild"
}

variable "tags" {
  type = map(string)
  description = "A list of tags attached to the pipeline resources"
}

variable "kms_key_arn" {
  type = string
  description = "The kms arn used to encrpyted the codebuild output artifact"
}

variable "env" {
  type = string
  description = "The environment of the pipeline"
}