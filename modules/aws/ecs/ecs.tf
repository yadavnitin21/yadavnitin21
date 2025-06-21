resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  service_connect_defaults {
    namespace = aws_service_discovery_http_namespace.namespace.arn
  }
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"

    }
  }




  tags = merge({
    name         = var.ecs_cluster_name
    environment  = var.environment
    organization = var.organization
    service      = var.service
  }, var.tags)
}
