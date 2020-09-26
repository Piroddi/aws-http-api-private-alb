locals{
  env = "dev"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  version = "2.67.0"
  profile = "piroddicloud"
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
    bucket = "euw1-http-api-terraform-state"
    key = "dev/networking/${path_relative_to_include()}/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "http-api-terraform-lock-table"
  }
}