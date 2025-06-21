### common variables
variable "environment" {
  description = "The name of environment"
}

variable "service" {
  description = "The name of service"
}

variable "organization" {
  description = "The name of organization"
}

### SG variables
variable "vpc_id" {}


## ec2 variables
variable "subnet_type" {}
variable "instance_count" {}
variable "key_name" {}
variable "ami" {}
variable "instance_type" {}
variable "associate_public_ip_address" {}
