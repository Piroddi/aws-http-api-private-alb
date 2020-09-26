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
    key = "dev/cognito/${path_relative_to_include()}/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "http-api-terraform-lock-table"
  }
}

inputs = {
  cognito_user_pool_name = "helloworld"
  domain = "piroddi.co.za"
  zone_id = "Z031603927XW5TC0MASP0"
}

terraform {
  source = "../../../modules/cognito"


  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "tags.tfvars"
    ]
  }
}

