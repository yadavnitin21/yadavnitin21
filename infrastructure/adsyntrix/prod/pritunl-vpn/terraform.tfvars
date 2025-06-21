## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "adsyntrix"

### sg variables
vpc_id = "vpc-0b3b3c0cf06405738"


### ec2 vars
subnet_type      = "public"
instance_count   = "1"
key_name         = "devops-1"
ami              = "ami-0f8ca728008ff5af4"
instance_type    = "t3.micro"
elastic_ip       = true
enable_snapshots = true
