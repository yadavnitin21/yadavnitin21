terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-easyio-tf-state-s3-01"
    key            = "tf/easyio/prod/cloudfront-physio-patient-web/terraform.tfstate"
    dynamodb_table = "prod-easyio-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "easyio-prod"
  }
}
