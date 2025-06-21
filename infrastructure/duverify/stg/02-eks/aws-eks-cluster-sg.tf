### Security group for EKS node Group and EKS cluster
resource "aws_security_group" "eks" {
  name        = "${var.environment}-${var.organization}-security-group-eks-01"
  description = "eks security group for api access and node access"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  tags = {
    Name               = "${var.environment}-${var.organization}-security-group-eks-01"
    tag_component_name = "eks"
  }
}

resource "aws_security_group_rule" "eks_ingress_vpc_cidr" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"

  cidr_blocks       = [data.aws_vpc.current_vpc.cidr_block]
  security_group_id = aws_security_group.eks.id
  description       = "vpc cidr"
}

### Security group for elb
resource "aws_security_group" "eks_elb" {
  name        = "${var.environment}-${var.organization}-security-group-eks-elb-01"
  description = "EKS lb security group"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  tags = {
    Name               = "${var.environment}-${var.organization}-security-group-eks-elb-01"
    tag_component_name = "eks"
  }
}

resource "aws_security_group_rule" "eks_elb_vpc_cidr" {
  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = -1

  cidr_blocks       = [data.aws_vpc.current_vpc.cidr_block]
  security_group_id = aws_security_group.eks_elb.id
  description       = "Allow all traffic from vpc cidr"
}



resource "aws_security_group_rule" "eks_elb_egress" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = -1

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_elb.id
  description       = "Allow all egress"
}

