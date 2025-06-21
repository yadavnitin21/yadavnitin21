terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-duverify-tf-state-s3-01"
    key            = "tf/duverify/prod/sysops-log-bucket/terraform.tfstate"
    dynamodb_table = "prod-duverify-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "duverify-prod"
  }
}