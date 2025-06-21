comment                = "CDN for soulbol-assets"
cdn_custom_domain_name = ["assets.soulbol.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:495599768662:certificate/5e66b503-21d2-4ab3-a2fd-24db596a443f"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "soulbol"
service                = "cloudfront-soulbol-assets"

allowed_methods     = ["GET", "HEAD", "OPTIONS"]
default_root_object = "index.html"
custom_error_responses = [{
  error_caching_min_ttl = 10
  error_code            = 403
  response_code         = 200
  response_page_path    = "/index.html"
}]

## s3 variable
versioning = true

## cache policy
custom_cache_policy = false
