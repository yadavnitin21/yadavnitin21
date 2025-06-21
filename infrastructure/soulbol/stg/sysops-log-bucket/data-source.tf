data "aws_iam_policy_document" "s3_policy" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.ap-south-1.amazonaws.com"]
    }

    actions = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::stg-soulbol-cloudwatch-logs-s3-01"]
  }

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.ap-south-1.amazonaws.com"]
    }

    actions = ["s3:PutObject"]
    resources = ["arn:aws:s3:::stg-soulbol-cloudwatch-logs-s3-01/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::718504428378:root"]
    }

    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::stg-soulbol-cloudwatch-logs-s3-01/*"]
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
