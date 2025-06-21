variable "bucket_name" {
  description = "name of s3 to be created"
  type        = string
}

variable "bucket_acl" {
  description = "The canned ACL to apply. Defaults to private"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "whether to enable bucket versioning, allowed values true or false"
  type        = bool
  default     = false
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

variable "s3_bucket_policy" {
  description = "Bucket policy in json"
  default     = ""
}

variable "block_public_access" {
  description = "Weather to block public access for S3 buckets"
  type        = bool
  default     = true
}

