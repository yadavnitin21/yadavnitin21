terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-elevatenow-tf-state-s3-01"
    key            = "tf/elevatenow/stg/sns-alerts/terraform.tfstate"
    dynamodb_table = "prod-elevatenow-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "elevatenow-prod"
  }
}
