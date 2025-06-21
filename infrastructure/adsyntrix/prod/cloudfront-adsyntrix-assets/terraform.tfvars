comment                = "CDN for prod adsyntrix-assets"
cdn_custom_domain_name = ["cdn.adsyntrix.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:977098999002:certificate/ed56ef99-a344-46b2-9d67-fc439c37a2ed"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "adsyntrix"
service                = "cloudfront-adsyntrix-assets"

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
