variable "ecr_repo_name" {
  description = "Name of ECR repo"
  type        = string
}

variable "tags" {
  description = "Tags to attach to ecr repo"
  type        = map(any)
  default     = {}
}
