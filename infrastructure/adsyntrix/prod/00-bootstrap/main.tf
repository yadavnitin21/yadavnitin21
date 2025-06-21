locals {
  tf_bucket_name = "${var.environment}-${var.organization}-${var.service}-s3-01"
  tf_table_name  = "${var.environment}-${var.organization}-${var.service}-dynamo-01"
}


module "tf_s3_backend" {
  source       = "../../../../modules/aws/S3"
  bucket_name  = local.tf_bucket_name
  environment  = var.environment
  organization = var.organization
  service      = var.service
}


module "tf_dynamo_backend" {
  source       = "../../../../modules/aws/dynamodb"
  environment  = var.environment
  organization = var.organization
  service      = var.service
  table_name   = local.tf_table_name
}
