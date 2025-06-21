### Vars
environment  = "stg"
organization = "elevatenow"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0de99647ea5cfd4b2", "subnet-042a26d4c94c14aeb", "subnet-0291c3fbe3a68b2f5"]
cluster_name         = "stg-elevatenow-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-020d64e26f5be4355"
vpc_cidr = "10.102.0.0/16"
### Capacity provider values
target_capacity = 100
