locals {
  aws_region     = "eu-west-1"
  aws_account_id = "816070112642"
  account_alias  = "piroddiCloud"
  aws_profile = "piroddiCloud"
  aws_provider_version  = "4.19.0"
  terraform_version = "1.1.9"
  terraform_state_s3_bucket = "euw1-http-api-terraform-state"
}

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket         = local.terraform_state_s3_bucket
    key             = "${get_path_from_repo_root()}/terraform.tfstate"
    skip_bucket_root_access  = true
    skip_bucket_enforced_tls = true
    disable_bucket_update    = true
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  profile = "${local.aws_profile}"
}
EOF
}

generate "version" {
  path = "versions.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  required_version = "1.1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> ${local.aws_provider_version}"
    }
  }
}
EOF
}