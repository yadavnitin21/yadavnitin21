comment                = "CDN for prod whealth-web"
cdn_custom_domain_name = ["dashboard.whealthstudio.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:993356881255:certificate/f908a7d5-2473-41e2-852e-841a45e0868d"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "whealth"
service                = "cloudfront-whealth-web"

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
