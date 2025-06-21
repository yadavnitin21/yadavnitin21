comment                = "CDN for prod uae-docsy-assets"
cdn_custom_domain_name = ["assets.docsy.ae"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:270443930724:certificate/28c6449a-f58d-426e-9e64-cf63fb566fd6"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "docsy"
service                = "uae-cloudfront-docsy-assets"

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
