dependency "vpc" {
  config_path = "../../networking/vpc"
}

dependency "alb" {
  config_path = "../../ecs_alb"
}

dependency "ecs_cluster" {
  config_path = "../../ecs_cluster"
}

inputs = {
  name = "serviceA"
  vpc_id = dependency.vpc.outputs.vpc_id
  private_subnet_ids = dependency.vpc.outputs.private_subnet_ids
  vpc_cidr_block = dependency.vpc.outputs.vpc_cidr
  app_image = "816070112642.dkr.ecr.eu-west-1.amazonaws.com/service_a"
  app_port = 8000
  fargate_cpu = 1024
  fargate_memory = 2048
  ecs_min_tasks = 1
  ecs_max_tasks = 3
  cluster_name = dependency.ecs_cluster.outputs.ecs_cluster_name
  ecs_security_group_id =  dependency.vpc.outputs.ecs_taks_sg
  alb_security_group = dependency.vpc.outputs.alb_sg
  alb_listner_arn = dependency.alb.outputs.alb_lister_arn
  alb_route_path = "/service-A" #Context path of springboot application
  alb_listner_priority= 100
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules/ecs_microservice"

  extra_arguments "common_vars"{
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("tags.tfvars")
    ]
  }
}

