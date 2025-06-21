### Vars
environment  = "uat"
organization = "easyio"
service      = "ecs-asg"

### ASG variables
# ami_id               = "ami-0c8892ce5874c1780"
instance_type        = "t3.small"
asg_maximum_size     = 7
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-0af51dde0d0c68ad8", "subnet-0e3e040b8c6407eae", "subnet-0cee72ed9d0860e97"]
cluster_name         = "uat-easyio-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-031952bab2db398b2"
vpc_cidr = "10.104.0.0/16"
### Capacity provider values
target_capacity = 100
