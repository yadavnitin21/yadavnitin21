data "aws_iam_policy_document" "s3_policy" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.me-central-1.amazonaws.com"]
    }

    actions = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${local.svc_bucket_name}/*"]
  }

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.me-central-1.amazonaws.com"]
    }

    actions = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${local.svc_bucket_name}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
  effect = "Allow"

  principals {
    type        = "Service"
    identifiers = ["logdelivery.elasticloadbalancing.amazonaws.com"]
  }

  actions   = ["s3:PutObject"]
  resources = ["arn:aws:s3:::${local.svc_bucket_name}/*"]
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
