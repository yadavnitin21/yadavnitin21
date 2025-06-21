module "s3_backend" {
  source       = "../../../../modules/aws/S3"
  bucket_name  = "${var.environment}-${var.organization}-${var.service}-s3-01"
  environment  = var.environment
  organization = var.organization
  service      = var.service
}
