### Vars
environment  = "stg"
organization = "soulbol"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 3
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-07d609c8356b1e3fa", "subnet-0df26a13b19b33773", "subnet-046bfda5b40d9e7fa"]
cluster_name         = "stg-soulbol-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0e51c82de49a6e2cc"
vpc_cidr = "10.104.0.0/16"
### Capacity provider values
target_capacity = 100
