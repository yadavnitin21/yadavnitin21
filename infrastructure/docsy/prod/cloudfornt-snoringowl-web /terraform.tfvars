comment                = "CDN for prod snoringowl-web"
cdn_custom_domain_name = ["snoringowl.com", "www.snoringowl.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:270443930724:certificate/93377b0c-8de1-4657-b4a4-77e71e7fc110"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "snoringowl"
service                = "cloudfront-snoringowl-web"

allowed_methods     = ["GET", "HEAD", "OPTIONS"]
default_root_object = "index.html"
custom_error_responses = [{
  error_caching_min_ttl = 10
  error_code            = 403
  response_code         = 200
  response_page_path    = "/index.html"
}]

## s3 variable
versioning = false

## cache policy
custom_cache_policy = false
