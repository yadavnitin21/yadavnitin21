locals {
  svc_bucket_name = "${var.environment}-${var.organization}-${var.service}-s3-uae-01"
}

module "s3_bucket" {
  source           = "../../../../modules/aws/S3"
  bucket_name      = local.svc_bucket_name
  environment      = var.environment
  organization     = var.organization
  service          = var.service
  s3_bucket_policy = data.aws_iam_policy_document.s3_policy.json
  bucket_acl       = "private"
}
