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


## ec2 vars
variable "subnet_type" {}
variable "instance_count" {}
variable "key_name" {}
variable "ami" {}
variable "instance_type" {}
variable "associate_public_ip_address" {}

### tg & listener rule variables
variable "create_tg" {}
variable "host_based_routing_rule" {}
variable "traffic_port" {}
variable "tg_protocol" {}
variable "tg_target_type" {}
variable "tg_listener_arn" {}
variable "tg_rule_priority" {}
variable "host_headers" {}
variable "path" {}
variable "unhealthy_threshold" {}
variable "lb_arn_suffix" {}