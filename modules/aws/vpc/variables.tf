variable "vpc_cidr" {}
variable "environment" {}
variable "organization" {
}
variable "service_name" {
  default = "vpc"
}
variable "vpc_name" {}
variable "public_cidrs" {

}

variable "private_cidrs" {

}

variable "create_public_rtb" {
  default = true
}

variable "azs" {

}

variable "additional_vpc_tags" {

}

variable "create_nat_gw" {
  default = true
}
