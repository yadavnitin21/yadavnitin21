
variable "comment" {}
variable "cdn_custom_domain_name" {}

# The ACM used for CloudFront custom domain. Must be at region us-east-1
variable "acm_certificate_arn" {}

variable "enable_shield" {}

variable "shield_region" {}

variable "environment" {}

variable "organization" {}

variable "service" {}

variable "default_root_object" {}

variable "custom_error_responses" {}


variable "custom_cache_policy" {}

variable "allowed_methods" {

}

## s3 variables
variable "versioning" {}
