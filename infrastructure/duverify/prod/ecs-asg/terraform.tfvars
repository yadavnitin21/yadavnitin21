### Vars
environment  = "prod"
organization = "duverify"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.medium"
asg_maximum_size     = 20
asg_minimum_size     = 1
asg_desired_capacity = 11
private_subnet_ids   = ["subnet-09eab8a3867f3cd85", "subnet-007fe3868ca764c61", "subnet-0d2c9795dbc06f063"]
cluster_name         = "prod-duverify-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-022ca1c4e947b845d"
vpc_cidr = "10.21.0.0/16"
### Capacity provider values
target_capacity = 100
