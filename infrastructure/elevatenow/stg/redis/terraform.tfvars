## common variables
environment  = "stg"
service      = "redis"
organization = "elevatenow"

### sg variables
vpc_id = "vpc-020d64e26f5be4355"


### ec2 vars
subnet_type                 = "database"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-0f8ca728008ff5af4"
instance_type               = "t3.micro"
associate_public_ip_address = false
