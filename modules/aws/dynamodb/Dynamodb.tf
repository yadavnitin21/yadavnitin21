resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge({
    name         = var.table_name
    environment  = var.environment
    organization = var.organization
    service      = var.service
  }, var.tags)
}


