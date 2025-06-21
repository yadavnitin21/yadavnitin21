variable "capacity_provider_name" {}
variable "asg_arn" {}
variable "managed_termination_protection" {
  default = "DISABLED"
}
variable "maximum_scaling_step_size" {
  default = 4
}
variable "minimum_scaling_step_size" {
  default = 1
}
variable "enabled_managed_scaling" {
  default = "ENABLED"
}
variable "target_capacity" {
  description = "target cpu utilization"
}
variable "ecs_cluster_name" {}
variable "enabled_default_capacity_provider" {
  default = true
}
