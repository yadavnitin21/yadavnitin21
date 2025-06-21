terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-docsy-tf-state-s3-01"
    key            = "tf/docsy/prod/cloudfront-docsy-server-assets/terraform.tfstate"
    dynamodb_table = "prod-docsy-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "docsy-prod"
  }
}
