
module "cdn" {
  source                 = "../../../../modules/aws/cloudfront"
  origin_domain_name     = module.s3_bucket.s3_bucket_regional_domain_name
  comment                = var.comment
  cdn_custom_domain_name = var.cdn_custom_domain_name
  acm_certificate_arn    = var.acm_certificate_arn
  enable_shield          = var.enable_shield
  shield_region          = var.shield_region
  environment            = var.environment
  service                = var.service
  allowed_methods        = var.allowed_methods
  default_root_object    = var.default_root_object
  custom_error_responses = var.custom_error_responses
  custom_cache_policy    = var.custom_cache_policy
  organization           = var.organization
}
