### Vars
environment  = "stg"
organization = "duverify"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.medium"
asg_maximum_size     = 5
asg_minimum_size     = 1
asg_desired_capacity = 2
private_subnet_ids   = ["subnet-00dec5c7a5d7521a3", "subnet-0554d096333198ca4", "subnet-037f5326a66391ab0"]
cluster_name         = "stg-duverify-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-058cf631c410267a6"
vpc_cidr = "10.101.0.0/16"
### Capacity provider values
target_capacity = 100
