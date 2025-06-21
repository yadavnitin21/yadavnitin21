### Vars
environment  = "prod"
organization = "docsy"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-05a4d8d0aeba4f58d"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0dc805b1ad39559cf", "subnet-0833b720f94799334", "subnet-0a058fdb1fd1b3120"]
cluster_name         = "prod-docsy-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-07ae30428f35cfb96"
vpc_cidr = "10.21.0.0/16"
### Capacity provider values
target_capacity = 100
