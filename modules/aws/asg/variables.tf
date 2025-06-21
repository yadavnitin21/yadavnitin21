variable "lt_name" {
  description = "name of template to be created"
  type        = string
}

variable "ami_id" {
  description = "ami we use to create template"
  type        = string
}
variable "instance_type" {
  description = "type of instance we want to create"
  type        = string
}

variable "security_group_ids" {
  description = "value"
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

variable "maximum_size" {
  description = "maximum size of auto scaling group"
  type        = string
}


variable "minimum_size" {
  description = "minimum size of auto scaling group"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "list of subnets in which we launch asg"
  type        = list(any)
}

variable "desired_capacity" {
  description = "desired capacity for ASG"
  type        = string
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
  type        = bool
}

variable "asg_name" {
  description = "Name of ASG"
  type        = string
}

variable "instance_profile_arn" {
  description = "The IAM Instance Profile to launch the instance with."
  type        = string

}

variable "user_data" {
  description = "The base64-encoded user data to provide when launching the instance."
}

variable "key_name" {
  description = "The name of Pem file to use for login in instance"
  default     = "devops"
}
