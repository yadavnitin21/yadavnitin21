### Vars
environment  = "prod"
organization = "soulbol"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0ff67a3471930febc"
instance_type        = "t3.small"
asg_maximum_size     = 5
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0d6226fa433c144f7", "subnet-00d3dba36b509245c", "subnet-05cce8be91a14072c"]
cluster_name         = "prod-soulbol-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-035fb52d8c820c526"
vpc_cidr = "10.24.0.0/16"
### Capacity provider values
target_capacity = 100
