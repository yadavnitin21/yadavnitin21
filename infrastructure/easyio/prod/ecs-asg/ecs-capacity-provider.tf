module "ecs_cluster_capacity_provider" {
  source                 = "../../../../modules/aws/ecs-capacity-provider"
  capacity_provider_name = "${var.environment}-${var.organization}-${var.service}-capacity-provider-01"
  asg_arn                = module.ecs_cluster_asg.asg_arn
  target_capacity        = var.target_capacity
  ecs_cluster_name       = var.cluster_name
}
