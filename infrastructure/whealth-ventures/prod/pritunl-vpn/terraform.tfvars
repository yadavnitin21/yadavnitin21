## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "whealth"

### sg variables
vpc_id = "vpc-0cb57450bc597e42c"


### ec2 vars
subnet_type      = "public"
instance_count   = "1"
key_name         = "devops"
ami              = "ami-0f8ca728008ff5af4"
instance_type    = "t3.micro"
elastic_ip       = true
enable_snapshots = true
