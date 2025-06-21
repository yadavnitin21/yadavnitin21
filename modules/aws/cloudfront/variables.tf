variable "origin_domain_name" {
  description = "The domain name of the S3 bucket or other origin"
  default     = ""
}

variable "enable_shield" {}
variable "shield_region" {}

variable "extra_origins" {
  type = list(object({
    domain_name          = string
    origin_id            = string
    shield_enabled       = bool
    origin_shield_region = string
  }))
  default = []
}

variable "custom_error_responses" {
  type = list(object({
    error_caching_min_ttl = number
    error_code            = number
    response_code         = number
    response_page_path    = string
  }))
  default = []
}

variable "comment" {}

variable "default_root_object" {
  default = ""
}

variable "cdn_custom_domain_name" {}

# variable "bucket_name" {
#   description = "Name of the s3 bucket to use as logs stroage"
#   default     = ""
# }

variable "allowed_methods" {
  description = "Allowed method we can do through cdn"
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "enable_compression" {
  description = "CloudFront to automatically compress content for web requests"
  default     = false
}

variable "enable_geo_restriction" {
  default = false
}

variable "allowed_locations" {
  description = "A list of allowed countries"
  default     = ["IN"]
}
variable "aliases" {
  type        = list(string)
  description = "Aliases (subdomains) for CloudFront Distribution"
  default     = []
}

variable "acm_certificate_arn" {
  description = "ARN of ACM certificate to be used with this distribution. If not provided, a new one will be created."
  default     = ""
}

variable "service" {}
variable "environment" {}
variable "organization" {}

## Cache policy variables
variable "custom_cache_policy" {
  description = "create custom cache policy"
  default     = false
}


