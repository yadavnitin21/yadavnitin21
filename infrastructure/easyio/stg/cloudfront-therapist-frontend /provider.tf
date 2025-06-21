provider "aws" {
  region  = "ap-south-1"
  profile = "easyio-prod"
  version = "~> 4"
}
provider "aws" {
  region  = "us-east-1"
  profile = "easyio-prod"
  alias   = "useast1"
  version = "~> 4"
}

