data "aws_iam_policy_document" "s3_policy" {

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


