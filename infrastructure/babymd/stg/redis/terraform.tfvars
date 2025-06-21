## common variables
environment  = "stg"
service      = "redis"
organization = "babymd"

### sg variables
vpc_id = "vpc-0ad6200d4d2e30291"


### ec2 variables
subnet_type                 = "database"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-0f8ca728008ff5af4"
instance_type               = "t3.micro"
associate_public_ip_address = false
