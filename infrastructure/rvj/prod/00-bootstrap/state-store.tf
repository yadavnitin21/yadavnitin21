terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-rvj-tf-state-s3-01"
    key            = "tf/rvj/prod/00-bootstrap/terraform.tfstate"
    dynamodb_table = "prod-rvj-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "rvj-prod"
  }
}
