dependencies {
  paths = ["../../ecs_alb", "../../networking/vpc"]
}


dependency "alb" {
  config_path = "../../ecs_alb"
}

dependency "vpc" {
  config_path = "../../networking/vpc"
}

inputs = {
  name = "helloworld"
  vpc_link_sg_ids = dependency.vpc.outputs.alb_sg
  private_subnets = dependency.vpc.outputs.private_subnet_ids
  alb_lister_arn = dependency.alb.outputs.alb_lister_arn
  route53_domain = "piroddi.co.za"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules/api_gateway"

  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}
