data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid     = "S3-policy-service-access"
    actions = ["s3:*Object", "s3:ListBucket"]
    resources = [
      join(":", ["arn", "aws", "s3", ":", local.svc_bucket_name]),
      join(":", ["arn", "aws", "s3", ":", "${local.svc_bucket_name}/*"])
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
  statement {
    sid     = "cloudfront-origin-access-policy"
    actions = ["s3:GetObject"]
    resources = [
      join(":", ["arn", "aws", "s3", ":", local.svc_bucket_name]),
      join(":", ["arn", "aws", "s3", ":", "${local.svc_bucket_name}/*"])
    ]
    principals {
      type        = "AWS"
      identifiers = [module.cdn.iam_arn]
    }
  }
  statement {
    sid     = "AllowSSLRequestsOnly"
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      join(":", ["arn", "aws", "s3", ":", local.svc_bucket_name]),
      join(":", ["arn", "aws", "s3", ":", "${local.svc_bucket_name}/*"])
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
