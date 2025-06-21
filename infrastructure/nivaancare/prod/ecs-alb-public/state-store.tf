terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-nivaancare-tf-state-s3-01"
    key            = "tf/nivaancare/prod/ecs-alb-public/terraform.tfstate"
    dynamodb_table = "prod-nivaancare-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "nivaancare-prod"
  }
}
