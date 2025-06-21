resource "aws_service_discovery_http_namespace" "namespace" {
  name        = var.ecs_cluster_name
  description = "Default Namespace for ${var.ecs_cluster_name}"
  tags = merge({
    name         = var.ecs_cluster_name
    environment  = var.environment
    organization = var.organization
    service      = var.service
  }, var.tags)
}
