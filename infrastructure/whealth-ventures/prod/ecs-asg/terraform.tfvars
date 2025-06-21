### Vars
environment  = "prod"
organization = "whealth"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-003abd661564e6378", "subnet-03df3bac1dc2cd44d", "subnet-063c67c3522ccfa29"]
cluster_name         = "prod-whealth-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0cb57450bc597e42c"
vpc_cidr = "10.23.0.0/16"
### Capacity provider values
target_capacity = 100
