resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = var.capacity_provider_name

  auto_scaling_group_provider {
    auto_scaling_group_arn         = var.asg_arn
    managed_termination_protection = var.managed_termination_protection

    managed_scaling {
      maximum_scaling_step_size = var.maximum_scaling_step_size
      minimum_scaling_step_size = var.minimum_scaling_step_size
      status                    = var.enabled_managed_scaling
      target_capacity           = var.target_capacity
    }
  }
}

resource "aws_ecs_cluster_capacity_providers" "capacity_provider" {
  cluster_name = var.ecs_cluster_name

  capacity_providers = [aws_ecs_capacity_provider.capacity_provider.name]

  dynamic "default_capacity_provider_strategy" {
    for_each = var.enabled_default_capacity_provider ? [1] : []
    content {
      base              = 1
      weight            = 100
      capacity_provider = aws_ecs_capacity_provider.capacity_provider.name
    }
  }
}
