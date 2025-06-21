resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  tags = {
    environment = var.environment
    organization = var.organization
    service = var.service
  }

  lifecycle {
    create_before_destroy = true
  }
}
