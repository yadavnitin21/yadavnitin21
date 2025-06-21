### Vars
environment  = "stg"
organization = "nivaancare"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0bedef3f6918c9d02", "subnet-09920c41b524c4105", "subnet-0c60ca4519849aec7"]
cluster_name         = "stg-nivaancare-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0b6e4232b2136f939"
vpc_cidr = "10.100.0.0/16"
### Capacity provider values
target_capacity = 100
