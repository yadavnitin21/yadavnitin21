## common variables
environment  = "stg"
service      = "redis"
organization = "soulbol"

### sg variables
vpc_id = "vpc-0e51c82de49a6e2cc"


### ec2 vars
subnet_type                 = "public"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-053b12d3152c0cc71"
instance_type               = "t2.micro"
associate_public_ip_address = true
