resource "aws_kms_key" "kms_key" {
  description              = var.kms_key_description
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.policy
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.kms_key_is_enabled
  key_usage                = var.key_usage
  enable_key_rotation      = var.enable_key_rotation
  tags                     = var.tags_basic
}

resource "aws_kms_alias" "kms-key-alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.kms_key.key_id
}

output "kms_key_arn" {
  value = aws_kms_key.kms_key.arn
}

output "kms_key_alias_arn" {
  value = aws_kms_alias.kms-key-alias.arn
}

output "kms_key_id" {
  value = aws_kms_key.kms_key.id
}
