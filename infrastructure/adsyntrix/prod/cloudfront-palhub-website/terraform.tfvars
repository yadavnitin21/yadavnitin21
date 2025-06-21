comment                = "CDN for prod palhub-website"
cdn_custom_domain_name = ["palhub.sitegrid.io"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:977098999002:certificate/5fac34dc-f888-45af-9b9b-8dd0f0a72f4f"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "sitegrid"
service                = "cloudfront-palhub-website"

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
