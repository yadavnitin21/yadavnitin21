## common variables
environment  = "stg"
service      = "redis"
organization = "doscy"

### sg variables
vpc_id = "vpc-080f843d81f84c594"


### ec2 vars
subnet_type                 = "database"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-0f8ca728008ff5af4"
instance_type               = "t2.micro"
associate_public_ip_address = false
