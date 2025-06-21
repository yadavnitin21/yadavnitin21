### Vars
environment  = "prod"
organization = "nivaancare"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.medium"
asg_maximum_size     = 1
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-072ee5a0e6d27a5db", "subnet-05cb226eac5ae5482"]
cluster_name         = "prod-nivaancare-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-0c3a8546887d1e247"
vpc_cidr = "10.0.0.0/16"
