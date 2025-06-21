comment                = "CDN for docsy-web"
cdn_custom_domain_name = ["staging-web1.mydocsy.com", "staging-web.mydocsy.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:270443930724:certificate/45b161ab-dc93-4185-86bf-d749358d231c"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "stg"
organization           = "docsy"
service                = "cloudfront-docsy-web"

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
