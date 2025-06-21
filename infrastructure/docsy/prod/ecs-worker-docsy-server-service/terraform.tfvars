environment          = "prod"
organization         = "docsy"
service              = "worker-docsy-server"
log_retention_period = 30 ## days
cluster_id           = "prod-docsy-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "worker-docsy-server"
container_port     = 3000
task_subnets       = ["subnet-02791a009c1f2f697", "subnet-0a4ce0140a8ce5fad", "subnet-014988193ee80033e"]
vpc_cidr           = "10.20.0.0/16"
vpc_id             = "vpc-058b94d33ca49cea9"
capacity_provider  = "prod-docsy-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::270443930724:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
# create_tg               = true
# host_based_routing_rule = true
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:270443930724:listener/app/prod-docsy-ecs-alb-public/820101a5130b0990/5bca04e19267e1bb"
# tg_rule_priority        = 10
# host_headers            = ["mydocsy.com", "api.mydocsy.com", "www.mydocsy.com", "qrindia.mydocsy.com"]

