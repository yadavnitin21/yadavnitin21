## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "nivaancare"

### sg variables
vpc_id = "vpc-0c3a8546887d1e247"


### ec2 vars
subnet_type    = "public-application"
instance_count = "1"
key_name       = "devops"
ami            = "ami-0f8ca728008ff5af4"
instance_type  = "t3.micro"
elastic_ip     = true
