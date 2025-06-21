## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "duverify"

### sg variables
vpc_id = "vpc-022ca1c4e947b845d"


### ec2 vars
subnet_type    = "public"
instance_count = "1"
key_name       = "devops"
ami            = "ami-0f8ca728008ff5af4"
instance_type  = "t3.micro"
elastic_ip     = true
