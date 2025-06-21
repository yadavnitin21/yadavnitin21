module "ecs_service" {
  source                = "../../../../modules/aws/ecs-service"
  environment           = var.environment
  organization          = var.organization
  service               = var.service
  log_retention_period  = var.log_retention_period
  container_definitions = local.container_definitions
  cluster_id            = var.cluster_id
  desired_count         = var.desired_count
  max_percent           = var.max_percent
  min_healthy_percent   = var.min_healthy_percent
  tg_arn                = module.ecs_tg.tg_arn
  container_name        = var.container_name
  container_port        = var.container_port
  execution_role_arn    = var.execution_role_arn
  ## networ config
  task_subnets      = var.task_subnets
  vpc_cidr          = var.vpc_cidr
  vpc_id            = var.vpc_id
  capacity_provider = var.capacity_provider

}
