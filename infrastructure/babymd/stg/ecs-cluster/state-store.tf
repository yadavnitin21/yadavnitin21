terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "prod-babymd-tf-state-s3-01"
    key            = "tf/babymd/stg/ecs-cluster/terraform.tfstate"
    dynamodb_table = "prod-babymd-tf-state-dynamo-01"
    region         = "ap-south-1"
    profile        = "babymd-prod"
  }
}
