resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  versioning {
    enabled = var.versioning_enabled
  }

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = merge({
    name         = var.bucket_name
    environment  = var.environment
    organization = var.organization
    service      = var.service
  }, var.tags)
}


resource "aws_s3_bucket_policy" "private" {
  count  = var.s3_bucket_policy == "" ? 0 : 1
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.s3_bucket_policy
}


resource "aws_s3_bucket_public_access_block" "private" {
  count  = var.block_public_access ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
