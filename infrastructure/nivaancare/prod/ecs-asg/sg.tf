resource "aws_security_group" "ecs_cluster_asg_sg" {
  name        = "${var.environment}-${var.organization}-${var.service}-sg-01"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.environment}-${var.organization}-${var.service}-sg-01"
  }
}


resource "aws_security_group_rule" "egress_all_traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_cluster_asg_sg.id
}
resource "aws_security_group_rule" "allow_http_from_vpc" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.ecs_cluster_asg_sg.id
}
resource "aws_security_group_rule" "allow_ssh_from_vpc" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.ecs_cluster_asg_sg.id
}
resource "aws_security_group_rule" "allow_https_from_vpc" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.ecs_cluster_asg_sg.id
}
