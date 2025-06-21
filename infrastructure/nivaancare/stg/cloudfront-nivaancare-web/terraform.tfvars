comment                = "CDN for stg Nivaancare-web"
cdn_custom_domain_name = ["staging1.nivaancare.co.in", "staging.nivaancare.co.in"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:563901759783:certificate/cee05769-99f8-4576-b272-9b1ca45907c2"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "stg"
organization           = "nivaancare"
service                = "cloudfront-nivaancare-web"

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
