locals {
  tags = merge({
    Name         = var.asg_name
    environment  = var.environment
    organization = var.organization
    service      = var.service
  }, var.tags)
}

resource "aws_launch_template" "launch_template" {
  name_prefix            = var.lt_name
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  iam_instance_profile {
    arn = var.instance_profile_arn
  }
  monitoring {
    enabled = var.monitoring
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = "true"
      encrypted             = "true"
      volume_size           = 30
      volume_type           = "gp2"
    }
  }
  user_data = var.user_data
}

resource "aws_autoscaling_group" "asg" {
  # availability_zones = [var.availability_zones]
  name                = var.asg_name
  vpc_zone_identifier = var.vpc_zone_identifier
  desired_capacity    = var.desired_capacity
  max_size            = var.maximum_size
  min_size            = var.minimum_size

  dynamic "tag" {
    for_each = local.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  }

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }


}
