comment                = "Cloudfront for Docsy"
cdn_custom_domain_name = ["cdn.mydocsy.com"]
acm_certificate_arn    = "arn:aws:acm:us-east-1:270443930724:certificate/45b161ab-dc93-4185-86bf-d749358d231c"
enable_shield          = true
shield_region          = "ap-south-1"
environment            = "prod"
organization           = "docsy"
service                = "cloudfront-docsy-cdn"

allowed_methods     = ["GET", "HEAD", "OPTIONS"]
default_root_object = ""
custom_error_responses = []

## s3 variable
versioning = false
origin_domain_name = "prod-docsy-docsy-meta-server-s3-01.s3.ap-south-1.amazonaws.com"
## cache policy
custom_cache_policy = false
