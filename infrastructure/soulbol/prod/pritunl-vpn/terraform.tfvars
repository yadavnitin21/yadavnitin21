## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "soulbol"

### sg variables
vpc_id = "vpc-035fb52d8c820c526"


### ec2 vars
subnet_type      = "public"
instance_count   = "1"
key_name         = "devops"
ami              = "ami-00bb6a80f01f03502"
instance_type    = "t3.micro"
elastic_ip       = true
enable_snapshots = true
