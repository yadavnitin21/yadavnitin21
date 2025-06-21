provider "aws" {
  region  = "ap-south-1"
  profile = "whealth-ventures-prod"
  version = "~> 4"
}
provider "aws" {
  region  = "us-east-1"
  profile = "whealth-ventures-prod"
  alias   = "useast1"
  version = "~> 4"
}

