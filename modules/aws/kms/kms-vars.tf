variable "kms_key_description" {
  default = "kms key"
}

variable "kms_key_alias" {}
variable "policy" {}
variable "enable_key_rotation" {
  default = true
}
variable "kms_key_is_enabled" {
  default = true
}
variable "tags_basic" {
  type = map(string)
}

variable "deletion_window_in_days" {
  default = 20
}
variable "key_usage" {
  default = "ENCRYPT_DECRYPT"
}
variable "customer_master_key_spec" {
  default = "SYMMETRIC_DEFAULT"
}
