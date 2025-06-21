### Vars
environment  = "stg"
organization = "babymd"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-03bf9f8857add3e2d", "subnet-012d2faacf9d66b4f", "subnet-09ec84f673dbfaf7d"]
cluster_name         = "stg-babymd-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0ad6200d4d2e30291"
vpc_cidr = "10.101.0.0/16"
### Capacity provider values
target_capacity = 100
