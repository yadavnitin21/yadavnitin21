### Vars
environment  = "prod"
organization = "elevatenow"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-03354070041b9b9fa", "subnet-0c1b7f4286fecf16b", "subnet-00ec8e51ed7acb7dc"]
cluster_name         = "prod-elevatenow-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0d02c78b960375e5a"
vpc_cidr = "10.22.0.0/16"
### Capacity provider values
target_capacity = 100
