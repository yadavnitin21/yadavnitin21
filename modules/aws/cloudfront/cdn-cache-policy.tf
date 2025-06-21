resource "aws_cloudfront_cache_policy" "cache_policy" {
  count       = var.custom_cache_policy ? 1 : 0
  name        = "${local.origin_id}-cache-policy"
  comment     = "${local.origin_id}-cache-policy"
  default_ttl = 86400
  max_ttl     = 31536000
  min_ttl     = 1
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
      #   cookies {
      #     items = ["example"]
      #   }
    }
    headers_config {
      header_behavior = "whitelist"
      headers {
        items = ["Host"]
      }
    }
    query_strings_config {
      query_string_behavior = "none"
      #   query_strings {
      # items = ["example"]
      #   }
    }
    enable_accept_encoding_gzip   = true
    enable_accept_encoding_brotli = true
  }
}
