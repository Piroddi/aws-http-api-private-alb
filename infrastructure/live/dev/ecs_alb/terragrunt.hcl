dependency "vpc" {
  config_path = "../networking/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "helloworld"
  private_subnet_ids = dependency.vpc.outputs.private_subnet_ids
  app_port = "8000"
  vpc_id = dependency.vpc.outputs.vpc_id
  alb_security_group = dependency.vpc.outputs.alb_sg
}

terraform {
  source = "../../../modules/ecs_alb"


  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}

