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
private_subnet_ids   = ["subnet-089f8d9e15170cd70", "subnet-079367912bf0063d2", "subnet-00df23006646ab5f5"]
cluster_name         = "stg-docsy-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-03428a5e44241c282"
vpc_cidr = "10.200.0.0/16"
### Capacity provider values
target_capacity = 100
