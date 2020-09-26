inputs = {
  vpc_tag_name = "custom-vpc"
  vpc_cidr_block = "10.0.0.0/16"
  number_of_private_subnet = 2
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  private_subnet_cidr_blocks = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnet_tag_name = "helloworld-private"
  env    = "dev"
  region = "eu-west-1"
  route_table_tag_name = "helloworld public"
  security_group_lb_name = "helloworld-dev-alb"
  security_group_lb_description = "Single alb for all helloworld incoming requests"
  security_group_ecs_tasks_name = "helloworld ecs tasks sg"
  security_group_ecs_tasks_description = "Single sg for all helloworld ecs tasks"
  app_port = "8080"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules/network/vpc"


  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}




