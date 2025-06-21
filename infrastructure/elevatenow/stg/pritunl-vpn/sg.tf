resource "aws_security_group" "security_group_ec2" {
  name        = "${var.environment}-${var.organization}-${var.service}-ec2-sg"
  description = "Security group for ${var.service} server"
  vpc_id      = var.vpc_id

  tags = {
    Name         = "${var.environment}-${var.organization}-${var.service}-ec2-sg"
    environment  = var.environment
    service      = var.service
    organization = var.organization
  }
}

resource "aws_security_group_rule" "allow_ingress_http_from_vpc" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.selected.cidr_block]
  security_group_id = aws_security_group.security_group_ec2.id
  description       = "allow http traffic from vpc"
}

resource "aws_security_group_rule" "allow_ingress_https_from_vpc" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_ec2.id
  description       = "allow http traffic from vpc"
}

resource "aws_security_group_rule" "allow_ingress_vpn_port_from_all" {
  type              = "ingress"
  from_port         = 14559
  to_port           = 14559
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_ec2.id
  description       = "allow udp traffic on port 14559 from everywhere"
}

resource "aws_security_group_rule" "allow_egress_all_to_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_ec2.id
  description       = "allow all outbound"
}

