module "waf_rule" {
  source                                = "../../../../modules/aws/waf"
  scope                                 = "REGIONAL"
  waf_rule_name                         = "${var.environment}-docsy-alb-waf-01"
  waf_description                       = var.waf_description
  cloudwatch_metrics_enabled            = var.cloudwatch_metrics_enabled
  waf_default_action                    = var.waf_default_action
  enable_rate_limit_geo_match_statement = false
  max_request_rate_limit                = var.max_request_rate_limit
}
