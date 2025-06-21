provider "aws" {
  region  = "ap-south-1"
  profile = "nivaancare-prod"
  version = "~> 4"
}
provider "aws" {
  region  = "us-east-1"
  profile = "nivaancare-prod"
  alias   = "useast1"
  version = "~> 4"
}

