comment                = "CDN for test therapist-frontend"
cdn_custom_domain_name = ["therapist-test-auto.easyioprod.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:310605654423:certificate/7f31bd63-47bf-4dd0-bf3d-b058c9df2eb8"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "test"
organization           = "easyio"
service                = "cloudfront-therapist-frontend"

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
