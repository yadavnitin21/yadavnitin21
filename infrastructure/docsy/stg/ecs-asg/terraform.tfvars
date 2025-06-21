### Vars
environment  = "stg"
organization = "docsy"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0920a396fe8cfd2b8", "subnet-072f26af6b3a9e6f8", "subnet-0d2137f62b9d7977a"]
cluster_name         = "stg-docsy-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-080f843d81f84c594"
vpc_cidr = "10.100.0.0/16"
### Capacity provider values
target_capacity = 100
