terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-whealth-ventures-tf-state-s3-01"
    key            = "tf/whealth-ventures/prod/cloudfront-whealth-web/terraform.tfstate"
    dynamodb_table = "prod-whealth-ventures-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "whealth-ventures-prod"
  }
}
