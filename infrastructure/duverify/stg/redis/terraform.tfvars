## common variables
environment  = "stg"
service      = "redis"
organization = "duverify"

### sg variables
vpc_id = "vpc-058cf631c410267a6"


### ec2 vars
subnet_type                 = "database"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-00bb6a80f01f03502"
instance_type               = "t2.micro"
associate_public_ip_address = false
