variable "codepipeline_name" {
  type = string
  description = "The name of the codepipeline project"
}

variable "github_org" {
  type = string
  description = "The github account name"
}

variable "github_token" {
  type = string
  description = "The personal token from github with access to the repo name "
}

variable "repository_name" {
  type = string
  description = "The repo name for the pipeline"

}

variable "branch_name" {
  type = string
  description = "The branch on the repo to build"
}

variable "env" {
  type = string
  description = "The environment of the pipeline"
}

variable "S3_bucket_name" {
  type = string
  description = "The s3 bucket name to store the pipeline artifacts"
}

variable "codebuild_project_name" {
  type = string
  description = "The name of the codebuild project to be add to the pipeline"
}

variable "tags" {
  type = map(string)
  description = "A list of tags attached to the pipeline resources"
}

variable "kms_key_arn" {
  type = string
  description = "The kms arn used to encrpyted the codebuild output artifact"
}

variable "ecs_service_name" {
  type = string
  description = "The name of the ECS service"
}

variable "ecr_repo" {
  type = string
  description = "Name of ecr repo"
}