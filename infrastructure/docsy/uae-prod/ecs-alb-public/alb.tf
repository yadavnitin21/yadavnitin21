locals {
  lb_name = "${var.environment}-${var.organization}-${var.service}"
}
module "ecs_alb" {
  source                     = "../../../../modules/aws/alb/lb/"
  lb_name                    = local.lb_name
  is_internal                = var.is_internal
  lb_sg_ids                  = [aws_security_group.security_group_alb.id]
  subnet_type                = var.subnet_type
  enable_deletion_protection = var.enable_deletion_protection
  service                    = var.service
  environment                = var.environment
  organization               = var.organization
  lb_log_bucket              = var.lb_log_bucket
}


module "ecs_alb_listener" {
  source                 = "../../../../modules/aws/alb/listener/"
  lb_arn                 = module.ecs_alb.lb_arn
  http_to_https_redirect = true
  https_fixed_response   = true
  certificate_arn        = var.certificate_arn
}
