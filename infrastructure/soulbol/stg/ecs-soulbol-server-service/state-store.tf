terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-soulbol-tf-state-s3-01"
    key            = "tf/soulbol/stg/ecs-soulbol-server-service/terraform.tfstate"
    dynamodb_table = "prod-soulbol-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "soulbol-prod"
  }
}
