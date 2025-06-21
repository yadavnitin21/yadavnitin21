## common variables
environment  = "prod"
service      = "pritunl-vpn"
organization = "docsy"

### sg variables
vpc_id = "vpc-07ae30428f35cfb96"


### ec2 vars
subnet_type      = "public"
instance_count   = "1"
key_name         = "devops"
ami              = "ami-0b98fa71853d8d270"
instance_type    = "t3.micro"
elastic_ip       = true
enable_snapshots = true
availability_zones     = ["me-central-1a", "me-central-1b"]
