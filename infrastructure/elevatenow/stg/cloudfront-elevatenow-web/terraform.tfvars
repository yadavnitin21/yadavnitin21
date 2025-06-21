comment                = "CDN for stg Elevatenow-web"
cdn_custom_domain_name = ["stagingweb.joinelevatenow.co.in", "staging-web-1.joinelevatenow.co.in"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:110978465451:certificate/a0b1e178-8283-4e3d-b8c2-40c42d0c0828"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "stg"
organization           = "elevatenow"
service                = "cloudfront-elevatenow-web"

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
