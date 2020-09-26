inputs = {
  name = "serviceB"
  scan = false

}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../modules/cicd/ecr"

  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}