### Vars
environment  = "prod"
organization = "babymd"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0722da058af99979c", "subnet-0bc8e07d067ad1c86", "subnet-0374d4256d42cebce"]
cluster_name         = "prod-babymd-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-09e0f170e7c4235e9"
vpc_cidr = "10.21.0.0/16"
### Capacity provider values
target_capacity = 100
