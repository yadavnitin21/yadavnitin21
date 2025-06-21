locals {
  user_data = templatefile("./user-data.sh", {
    ecs_cluster_name = var.cluster_name
  })
}
module "ecs_cluster_asg" {
  source               = "../../../../modules/aws/asg"
  environment          = var.environment
  organization         = var.organization
  service              = var.service
  lt_name              = "${var.environment}-${var.organization}-${var.service}-lt-01"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  security_group_ids   = [aws_security_group.ecs_cluster_asg_sg.id]
  maximum_size         = var.asg_maximum_size
  minimum_size         = var.asg_minimum_size
  desired_capacity     = var.asg_desired_capacity
  vpc_zone_identifier  = var.private_subnet_ids
  asg_name             = "${var.environment}-${var.organization}-${var.service}-01"
  instance_profile_arn = module.ecs_cluster_asg_role.instance_profile_arn
  user_data            = base64encode(local.user_data)
  tags = {
    cluster_name     = var.cluster_name
    AmazonECSManaged = true
  }
}
