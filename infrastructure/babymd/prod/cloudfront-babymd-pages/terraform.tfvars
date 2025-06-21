comment                = "CDN for prod Babymd-pages"
cdn_custom_domain_name = ["home.babymd.in"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:778152842232:certificate/81e69408-e03f-458a-a0d7-0e6108b2ac9c"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "babymd"
service                = "cloudfront-babymd-pages"

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
