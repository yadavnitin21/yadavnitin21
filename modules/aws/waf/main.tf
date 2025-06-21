resource "aws_wafv2_web_acl" "aws-waf-rule" {
  name        = var.waf_rule_name
  description = var.waf_description
  scope       = var.scope

  dynamic "default_action" {
    for_each = var.waf_default_action == "block" ? [1] : []
    content {
      block {}
    }
  }

  dynamic "default_action" {
    for_each = var.waf_default_action == "allow" ? [1] : []
    content {
      allow {}
    }
  }

  rule {
    name     = "rate_based_limit"
    priority = 1

    action {
      block {}
      #count {}
    }

    statement {
      rate_based_statement {
        #in the range (100 - 2000000000)
        limit              = var.max_request_rate_limit
        aggregate_key_type = "IP"

        dynamic "scope_down_statement" {
          for_each = var.enable_rate_limit_geo_match_statement == true ? [1] : []
          content {
            geo_match_statement {
              country_codes = var.allowed_country_codes
            }
          }
        }
      }
    }

    # For false positive check, you can change action to count, and change cloudwatch_metrics and sampled_requests to enable for debugging
    # refer to https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups.html
    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "rate_based_limit"
      sampled_requests_enabled   = false
    }
  }

  dynamic "rule" {
    for_each = length(var.exception_prefixes) == 0 ? [] : ["rule-2-allow-exception-prefix"]
    content {

      name     = "rule-2-allow-exception-prefix"
      priority = 2

      action {
        allow {}
      }

      statement {
        or_statement {
          dynamic "statement" {
            for_each = var.exception_prefixes
            content {
              byte_match_statement {
                field_to_match {
                  uri_path {}
                }
                positional_constraint = "EXACTLY"
                search_string         = statement.value
                text_transformation {
                  priority = 1
                  type     = "NORMALIZE_PATH"
                }
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "prefixes_exceptions"
        sampled_requests_enabled   = false
      }
    }
  }


  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 3

    #By default, AWS managed rule is blocked when hit
    override_action {
      none {}
      #count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"


        excluded_rule {
          name = "SizeRestrictions_BODY"
        }
        excluded_rule {
          name = "CrossSiteScripting_BODY"
        }

        #excluded_rule {
        #  name = "NoUserAgent_HEADER"
        #}
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 4

    override_action {
      none {}
      #count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 5

    override_action {
      none {}
      #count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "AWS-AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 9

    override_action {
      none {}
      #count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSManagedRulesAnonymousIpList"
    priority = 10

    override_action {
      none {}
      #count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"

        #excluded_rule {
        #  name = "AnonymousIPList"
        #}

        #Test that comment this block will make the rule hit and block request
        excluded_rule {
          name = "HostingProviderIPList"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
      metric_name                = "AWS-AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = false
    }
  }
  dynamic "rule" {
    for_each = var.ip_set_arn != "" ? [1] : []
    content {
      name     = "allowed_ips"
      priority = 11
      action {
        allow {}
      }
      statement {
        ip_set_reference_statement {
          arn = var.ip_set_arn
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "allowed_ips"
        sampled_requests_enabled   = false
      }
    }
  }

  dynamic "rule" {
    for_each = var.ipv6_set_arn != "" ? [1] : []
    content {
      name     = "allowed_ipv6"
      priority = 12
      action {
        allow {}
      }
      statement {
        ip_set_reference_statement {
          arn = var.ipv6_set_arn
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
        metric_name                = "allowed_ipv6"
        sampled_requests_enabled   = false
      }
    }
  }




  # rule {
  #   name     = "rule-11"
  #   priority = 11

  #   override_action {
  #     none {}
  #     #count {}
  #   }

  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesBotControlRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }

  #   visibility_config {
  #     cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
  #     metric_name                = "AWS-AWSManagedRulesBotControlRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }

  tags = {
    Usage = "AWS_Managed_Rule"
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
    metric_name                = "MetricForWebACL"
    sampled_requests_enabled   = false
  }
}

# output "url" {
#   value = var.nice_domain_urls
# }

### Logging of WAF

resource "aws_cloudwatch_log_group" "waf" {
  name              = "aws-waf-logs-${var.waf_rule_name}-log-group"
  retention_in_days = var.cw_log_retention_in_days
}

resource "aws_wafv2_web_acl_logging_configuration" "waf" {
  log_destination_configs = [aws_cloudwatch_log_group.waf.arn]
  resource_arn            = resource.aws_wafv2_web_acl.aws-waf-rule.arn
}
