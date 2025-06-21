module "ecs_cluster_asg_role" {
  source       = "../../../../modules/aws/ec2-iam-role"
  environment  = var.environment
  organization = var.organization
  service      = var.service
  name         = "${var.environment}-${var.organization}-${var.service}-asg-role-01"
}
