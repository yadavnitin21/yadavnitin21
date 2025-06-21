resource "aws_security_group" "security_group_alb" {
  name        = "${var.environment}-${var.organization}-${var.service}-sg"
  description = "Security group for ${var.service}"
  vpc_id      = var.vpc_id

  tags = {
    Name         = "${var.environment}-${var.organization}-${var.service}-sg"
    environment  = var.environment
    service      = var.service
    organization = var.organization
  }
}

resource "aws_security_group_rule" "allow_ingress_http_from_internet" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_alb.id
  description       = "allow http traffic from internet"
}

resource "aws_security_group_rule" "allow_ingress_https_from_internet" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_alb.id
  description       = "allow https traffic from internet"
}

resource "aws_security_group_rule" "allow_egress_all_to_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_alb.id
  description       = "allow all outbound"
}

