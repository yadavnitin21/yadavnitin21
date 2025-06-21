variable "scope" {
  type        = string
  description = "(Required, Forces new resource) Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL. To work with CloudFront, you must also specify the region us-east-1 (N. Virginia) on the AWS provider."
}
variable "waf_rule_name" {
  type        = string
  description = "name of the WAF"
}

variable "waf_description" {
  type        = string
  description = "A short descrition of WAF"
}

variable "cloudwatch_metrics_enabled" {
  type        = bool
  description = "To enble couldwatch metrics for rules"
}

variable "ip_set_arn" {
  type        = string
  default     = ""
  description = "Arn of ip set"
}

variable "ipv6_set_arn" {
  type        = string
  default     = ""
  description = "Arn of ip set"
}

variable "exception_prefixes" {
  type        = set(string)
  default     = []
  description = "URL Prefixes to bypass checks"
}

variable "max_request_rate_limit" {
  type        = number
  default     = 10000
  description = "Max number of request to be accepted from same IP"
}

variable "waf_default_action" {
  default = "block"
}

variable "enable_rate_limit_geo_match_statement" {
  default = false
}
variable "allowed_country_codes" {
  default     = ["IN"]
  description = "allow traffic originating from these countries"
}

variable "cw_log_retention_in_days" {
  default = 30
}
