comment                = "CDN for stg Elevatenow-pages"
cdn_custom_domain_name = ["staging.joinelevatenow.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:110978465451:certificate/d4dc82c7-09db-4162-b532-f13febff3297"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "stg"
organization           = "elevatenow"
service                = "cloudfront-elevatenow-pages"

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
