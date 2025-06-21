comment                = "CDN for prod vycart-assets"
cdn_custom_domain_name = ["cdn.vycart.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:977098999002:certificate/120b2428-88df-4147-ab57-f2ad860fa1b0"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "vycart"
service                = "cloudfront-vycart-assets"

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
