### Vars
environment  = "prod"
organization = "docsy"
service      = "ecs-asg"

### ASG variables
ami_id               = "ami-0ff67a3471930febc"
instance_type        = "t3.small"
asg_maximum_size     = 17
asg_minimum_size     = 1
asg_desired_capacity = 1
private_subnet_ids   = ["subnet-014988193ee80033e", "subnet-02791a009c1f2f697", "subnet-0a4ce0140a8ce5fad"]
cluster_name         = "prod-docsy-ecs-cluster-01"


### SG variables
vpc_id   = "vpc-058b94d33ca49cea9"
vpc_cidr = "10.20.0.0/16"
### Capacity provider values
target_capacity = 100
