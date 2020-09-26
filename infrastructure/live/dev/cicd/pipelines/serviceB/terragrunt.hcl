inputs = {
  pipeline_name = "serviceB"
  repository_name = "aws-http-api-private-alb"
  branch_name = "master"
  tags = {
    app_name = "serviceB"
  }
  ecs_service_name = "serviceA-dev"
  github_secret = "Terraform"
  buildspec_location = "microservices/serviceB/buildspec.yaml"
  ecr_repo = "service_b"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../modules/cicd/pipelines/backend"

  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}