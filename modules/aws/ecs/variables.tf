variable "ecs_cluster_name" {
  description = "name of the cluster to be created"
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


