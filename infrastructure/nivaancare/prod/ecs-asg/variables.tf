variable "ami_id" {
  description = "ami we use to create template"
  type        = string
}
variable "instance_type" {
  description = "type of instance we want to create"
  type        = string
}

variable "environment" {
  description = "name of environment"
  type        = string
}

variable "organization" {
  description = "Name of organization"
  type        = string
}

variable "service" {
  description = "Name of service or use-case or role of this s3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags in form of key value pair"
  type        = map(any)
  default     = {}
}

variable "asg_maximum_size" {
  description = "maximum size of auto scaling group"
  type        = string
}

variable "asg_minimum_size" {
  description = "minimum size of auto scaling group"
  type        = string
}

variable "private_subnet_ids" {
  description = "list of subnets in which we launch asg"
  type        = list(any)
}

variable "asg_desired_capacity" {
  description = "desired capacity for ASG"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID in which resources will be crete"
  type        = string
}

variable "cluster_name" {
  description = "Name of ECS cluster, to which ec2 machines will be attached"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}
