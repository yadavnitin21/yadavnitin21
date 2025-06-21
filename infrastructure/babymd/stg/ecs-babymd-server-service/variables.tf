variable "environment" {}
variable "organization" {}
variable "service" {}

variable "log_retention_period" {}
variable "cluster_id" {}
variable "desired_count" {}
variable "max_percent" {}
variable "min_healthy_percent" {}
# variable "container_definitions" {}
# variable "tg_arn" {}
variable "container_name" {}
variable "container_port" {}
variable "task_subnets" {}
variable "vpc_cidr" {}
variable "vpc_id" {}
variable "capacity_provider" {}
variable "execution_role_arn" {}


variable "image_id" {}

### tg & listener rule variables
variable "create_tg" {}
variable "host_based_routing_rule" {}
variable "tg_protocol" {}
variable "tg_target_type" {}
variable "tg_listener_arn" {}
variable "tg_rule_priority" {}
variable "host_headers" {}
