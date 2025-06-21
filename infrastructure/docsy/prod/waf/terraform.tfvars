waf_description            = "Prod WAF"
cloudwatch_metrics_enabled = true
waf_default_action         = "allow"
environment                = "prod"
max_request_rate_limit     = 3000
