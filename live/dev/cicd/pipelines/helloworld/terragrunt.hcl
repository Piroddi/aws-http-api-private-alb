inputs = {
  pipeline_name = "helloworld"
  repository_name = "helloworld"
  branch_name = "develop"
  tags = {
    app_name = "helloworld"
  }
  ecs_service_name = "helloworld-dev"
  github_secret = ""
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