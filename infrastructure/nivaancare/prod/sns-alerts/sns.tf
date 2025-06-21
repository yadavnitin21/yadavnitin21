module "sns" {
  source      = "../../../../modules/aws/sns/"
  service                    = var.service
  environment                = var.environment
  organization               = var.organization
}