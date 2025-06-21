
variable "service" {
  description = "The name of service or use-case"
}

variable "enable_snapshots" {
  description = "enable snapshots for root volume"
  default     = false
  type        = bool
}

variable "security_group_ids" {
  description = "A list of security group ids"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "ami" {
  description = "The ami to launch instance in"
}

variable "instance_type" {
  description = "The type of instance to launch"
}

variable "monitoring" {
  type        = string
  description = "flag to decide whether we want detailed monitoring or not"
  default     = "false"
}

variable "environment" {}

variable "subnet_type" {}

variable "instance_count" {
  description = "number of instances required"
}

variable "key_name" {
  description = "Name of the key pair file to attach by default"
  default     = ""
}

variable "associate_public_ip_address" {
  default = "false"
}

variable "disable_api_termination" {
  default = "true"
}

variable "iam_role" {
  default     = ""
  description = "this is to add iam role to an instance"
}

variable "default_volume_type" {
  default = "gp2"
}

variable "root_block_device_size" {
  default = "8"
}

variable "root_block_device_encrypted" {
  default = true
}

variable "evaluation_periods" {
  default = "2"
}

variable "period" {
  default = "300"
}

variable "treat_missing_data" {
  default = "missing"
}

variable "elastic_ip" {
  description = "Attach EIP with first instance"
  default     = false
}

variable "organization" {
  description = "name of the organization eg. nivaancare"
}
