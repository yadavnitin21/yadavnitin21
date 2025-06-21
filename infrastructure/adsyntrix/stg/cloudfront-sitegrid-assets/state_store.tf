terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-adsyntrix-tf-state-s3-01"
    key            = "tf/adsyntrix/stg/cloudfront-sitegrid-web/terraform.tfstate"
    dynamodb_table = "prod-adsyntrix-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "adsyntrix-prod"
  }
}
