locals{
  env = "dev"
}

inputs = {
  env = "dev"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ecs_cluster"


  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}