### Vars
environment  = "prod"
organization = "adsyntrix"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.micro"
asg_maximum_size     = 5
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0fd9f2e209b67ac25", "subnet-082a926218ec04b2e", "subnet-0e4c26d386c507295"]
cluster_name         = "prod-adsyntrix-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0b3b3c0cf06405738"
vpc_cidr = "10.22.0.0/16"
### Capacity provider values
target_capacity = 100

