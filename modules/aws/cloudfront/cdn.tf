locals {
  origin_id = "${var.organization}-${var.environment}-${var.service}-cloudfront-01"
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.origin_domain_name
    origin_id   = local.origin_id

    origin_shield {
      enabled              = var.enable_shield
      origin_shield_region = var.shield_region
    }

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  dynamic "origin" {
    for_each = var.extra_origins == [] ? [] : var.extra_origins
    content {
      domain_name = origin.value.domain_name
      origin_id   = origin.value.origin_id
      origin_shield {
        enabled              = origin.value.shield_enabled
        origin_shield_region = origin.value.origin_shield_region
      }
      s3_origin_config {
        origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
      }
    }
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses == [] ? [] : var.custom_error_responses
    content {
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
      error_code            = custom_error_response.value.error_code
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.comment
  default_root_object = var.default_root_object == "" ? null : var.default_root_object
  aliases             = var.cdn_custom_domain_name

  # logging_config {
  #   include_cookies = false
  #   bucket          = var.bucket_name
  #   prefix          = "prod/cloudfront/logs"
  # }

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.origin_id

    # forwarded_values {
    #   query_string = true

    #   cookies {
    #     forward = "all"
    #   }
    #   headers = ["*"]
    # }

    cache_policy_id = var.custom_cache_policy ? aws_cloudfront_cache_policy.cache_policy[0].id : "658327ea-f89d-4fab-a63d-7e88639e58f6"

    compress = var.enable_compression

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    # default_ttl            = 3600
    # max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    # for_each = var.enable_geo_restriction == true ? [1] : []
    # content {
    dynamic "geo_restriction" {

      for_each = var.enable_geo_restriction == true ? [1] : []
      content {
        restriction_type = "whitelist"
        locations        = var.allowed_locations
      }
    }
    dynamic "geo_restriction" {
      for_each = var.enable_geo_restriction == false ? [1] : []
      content {
        restriction_type = "none"
        locations        = []
      }
    }
  }


  tags = {
    Name         = local.origin_id
    service      = var.service
    environment  = var.environment
    organization = var.organization
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
