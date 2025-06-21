locals {
  tg_name = "${var.environment}-${var.service}-tg-01"
}
module "ecs_tg" {
  source                  = "../../../../modules/aws/alb/target-group/"
  create_tg               = var.create_tg
  tg_name                 = local.tg_name
  traffic_port            = var.container_port
  protocol                = var.tg_protocol
  target_type             = var.tg_target_type
  vpc_id                  = var.vpc_id
  host_based_routing_rule = var.host_based_routing_rule
  listener_arn            = var.tg_listener_arn
  priority                = var.tg_rule_priority
  host_headers            = var.host_headers
  ### Health check vars
  healthy_threshold   = var.healthy_threshold
  interval            = var.interval
  timeout             = var.timeout
  unhealthy_threshold = var.unhealthy_threshold
}
