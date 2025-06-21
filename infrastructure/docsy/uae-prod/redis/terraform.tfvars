## common variables
environment  = "prod"
service      = "redis"
organization = "doscy"

### sg variables
vpc_id = "vpc-07ae30428f35cfb96"


### ec2 vars
subnet_type                 = "database"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-0b98fa71853d8d270"
instance_type               = "t3.micro"
associate_public_ip_address = false
availability_zones          = ["me-central-1a", "me-central-1b"]