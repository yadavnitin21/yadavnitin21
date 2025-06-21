comment                = "CDN for prod easyio-phyco-frontend"
cdn_custom_domain_name = ["phyco.easyio.ai"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:310605654423:certificate/da6c11a3-45dd-4fcc-9dfc-042a8c9d314d"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "easyio"
service                = "cloudfront-phyco-frontend"

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
