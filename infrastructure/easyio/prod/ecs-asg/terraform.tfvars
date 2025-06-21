### Vars
environment  = "prod"
organization = "easyio"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-01dbb74828c7ba2ec", "subnet-0ef4591ac5f331ba1", "subnet-0a05192aec00c7f6a"]
cluster_name         = "prod-easyio-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-01931393d72f5ef9e"
vpc_cidr = "10.24.0.0/16"
### Capacity provider values
target_capacity = 100
