comment = "CDN for prod codoctor agastyamd"
# cdn_custom_domain_name = ["agastyamd.in", "www.agastyamd.in"]
cdn_custom_domain_name = ["agastyamd.in", "www.agastyamd.in"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:778152842232:certificate/348a6a28-4819-429b-b9d1-cc208a25bf6a"

# acm_certificate_arn = "arn:aws:acm:us-east-1:778152842232:certificate/d8aef8ab-f6dc-45f7-a70e-039349699661"
enable_shield = true
shield_region = "ap-south-1"
environment   = "prod"
organization  = "agastyamd"
service       = "cloudfront-codoctor-agastyamd-in"

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
