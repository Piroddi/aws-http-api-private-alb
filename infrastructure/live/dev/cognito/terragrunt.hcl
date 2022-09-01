inputs = {
  cognito_user_pool_name = "helloworld"
  domain = "piroddi.link"
  zone_id = "Z02403873LWR6R97T22QN"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/cognito"


  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}

