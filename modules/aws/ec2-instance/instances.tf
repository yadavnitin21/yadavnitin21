/**
 * Instance
 */

resource "aws_instance" "instance-az1" {
  ami                         = var.ami
  source_dest_check           = false
  instance_type               = var.instance_type
  availability_zone           = element(var.availability_zones, 0)
  subnet_id                   = data.aws_subnet.subnet-az1.id
  vpc_security_group_ids      = var.security_group_ids
  monitoring                  = var.monitoring
  tenancy                     = "default"
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = var.iam_role
  count                       = floor(var.instance_count / 2.0)
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }
  root_block_device {
    volume_type = var.default_volume_type
    volume_size = var.root_block_device_size
    encrypted   = var.root_block_device_encrypted
  }

  tags = {
    Name             = "${var.environment}-${var.organization}-${var.service}-ec2-${element(split("-", element(var.availability_zones, 0)), 2)}-${count.index + 1}"
    environment      = var.environment
    service          = var.service
    organization     = var.organization
    enable_snapshots = var.enable_snapshots
  }

  volume_tags = {
    Name             = "${var.environment}-${var.organization}-${var.service}-ec2-${element(split("-", element(var.availability_zones, 0)), 2)}-${count.index + 1}"
    environment      = var.environment
    service          = var.service
    organization     = var.organization
    enable_snapshots = var.enable_snapshots
  }

  lifecycle {
    ignore_changes = ["user_data", "ami"]
  }
}

resource "aws_cloudwatch_metric_alarm" "instance_statuscheck_az1" {
  count               = var.environment == "prod" ? floor(var.instance_count / 2.0) : 0
  alarm_name          = format("%s-%s-%s-Instance-StatusCheckFailed-%s", var.environment, var.organization, var.service, aws_instance.instance-az1.*.private_ip[count.index])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Maximum"
  threshold           = "1.0"
  alarm_description   = "This metric monitor EC2 instance status check"
  treat_missing_data  = var.treat_missing_data
  # alarm_actions       = ["${data.aws_sns_topic.notification.arn}"]
  # ok_actions          = ["${data.aws_sns_topic.notification.arn}"]
  dimensions = {
    InstanceId = element(aws_instance.instance-az1.*.id, count.index)
  }
}

resource "aws_cloudwatch_metric_alarm" "instance_cpuutilization_az1" {
  count               = var.environment == "prod" ? floor(var.instance_count / 2.0) : 0
  alarm_name          = format("%s-%s-%s-Instance-HighCPUUtilization-%s", var.environment, var.organization, var.service, aws_instance.instance-az1.*.private_ip[count.index])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Maximum"
  threshold           = "70"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  treat_missing_data  = var.treat_missing_data
  # alarm_actions           = ["${data.aws_sns_topic.notification.arn}"]
  # ok_actions              = ["${data.aws_sns_topic.notification.arn}"]
  dimensions = {
    InstanceId = element(aws_instance.instance-az1.*.id, count.index)
  }
}


resource "aws_instance" "instance-az2" {
  ami                         = var.ami
  source_dest_check           = false
  instance_type               = var.instance_type
  availability_zone           = element(var.availability_zones, 1)
  subnet_id                   = data.aws_subnet.subnet-az2.id
  vpc_security_group_ids      = var.security_group_ids
  monitoring                  = var.monitoring
  tenancy                     = "default"
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = var.iam_role
  count                       = ceil(var.instance_count / 2.0)

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }
  root_block_device {
    volume_type = var.default_volume_type
    volume_size = var.root_block_device_size
    encrypted   = var.root_block_device_encrypted
  }

  tags = {
    Name             = "${var.environment}-${var.organization}-${var.service}-ec2-${element(split("-", element(var.availability_zones, 1)), 2)}-${count.index + 1}"
    environment      = var.environment
    service          = var.service
    organization     = var.organization
    enable_snapshots = var.enable_snapshots
  }

  volume_tags = {
    Name             = "${var.environment}-${var.organization}-${var.service}-ec2-${element(split("-", element(var.availability_zones, 1)), 2)}-${count.index + 1}"
    environment      = var.environment
    service          = var.service
    organization     = var.organization
    enable_snapshots = var.enable_snapshots
  }

  lifecycle {
    ignore_changes = ["user_data", "ami"]
  }
}

resource "aws_cloudwatch_metric_alarm" "instance_statuscheck_az2" {
  count               = var.environment == "prod" ? ceil(var.instance_count / 2.0) : 0
  alarm_name          = format("%s-%s-%s-Instance-StatusCheckFailed-%s", var.environment, var.organization, var.service, aws_instance.instance-az2.*.private_ip[count.index])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Maximum"
  threshold           = "1.0"
  alarm_description   = "This metric monitor EC2 instance status check"
  treat_missing_data  = var.treat_missing_data
  # alarm_actions       = ["${data.aws_sns_topic.notification.arn}"]
  # ok_actions          = ["${data.aws_sns_topic.notification.arn}"]
  dimensions = {
    InstanceId = element(aws_instance.instance-az2.*.id, count.index)
  }
}


resource "aws_cloudwatch_metric_alarm" "instance_cpuutilization_az2" {
  count               = var.environment == "prod" ? ceil(var.instance_count / 2.0) : 0
  alarm_name          = format("%s-%s-%s-Instance-HighCPUUtilization-%s", var.environment, var.organization, var.service, aws_instance.instance-az2.*.private_ip[count.index])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Maximum"
  threshold           = "70"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  treat_missing_data  = var.treat_missing_data
  # alarm_actions           = ["${data.aws_sns_topic.notification.arn}"]
  # ok_actions              = ["${data.aws_sns_topic.notification.arn}"]
  dimensions = {
    InstanceId = element(aws_instance.instance-az2.*.id, count.index)
  }
}
