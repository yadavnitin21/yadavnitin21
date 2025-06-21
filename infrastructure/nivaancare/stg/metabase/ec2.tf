module "ec2" {
  source                      = "../../../../modules/aws/ec2-instance"
  environment                 = var.environment
  organization                = var.organization
  subnet_type                 = var.subnet_type
  key_name                    = var.key_name
  instance_count              = var.instance_count
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  security_group_ids          = [aws_security_group.security_group_ec2.id]
  service                     = var.service
  iam_role                    = module.ec2_role.instance_profile_name
}
