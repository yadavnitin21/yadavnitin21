module "ecs_cluster" {
  source           = "../../../../modules/aws/ecs"
  ecs_cluster_name = var.ecs_cluster_name
  environment      = var.environment
  organization     = var.organization
  service = var.service
}
