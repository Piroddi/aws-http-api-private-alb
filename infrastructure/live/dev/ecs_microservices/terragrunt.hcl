generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  version = "2.67.0"
  profile = "cq"
  region = "eu-west-1"
}

terraform {
  required_version = "= 0.12.26"
  backend "s3" {}
}

EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket = "euw1-dev-terraform-state"
    key = "dev/ecs_microservice/${path_relative_to_include()}/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "dev-terraform-lock-table"
  }
}