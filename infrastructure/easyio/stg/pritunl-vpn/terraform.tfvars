## common variables
environment  = "uat"
service      = "pritunl-vpn"
organization = "easyio"

### sg variables
vpc_id = "vpc-031952bab2db398b2"


### ec2 vars
subnet_type    = "public"
instance_count = "1"
key_name       = "devops"
ami            = "ami-0f8ca728008ff5af4"
instance_type  = "t3.micro"
elastic_ip     = true
