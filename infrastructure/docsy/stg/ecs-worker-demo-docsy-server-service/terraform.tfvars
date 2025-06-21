environment          = "stg"
organization         = "docsy"
service              = "worker-demo-docsy-server"
log_retention_period = 7 ## days
cluster_id           = "stg-docsy-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "worker-demo-docsy-server"
container_port     = 3000
task_subnets       = ["subnet-072f26af6b3a9e6f8", "subnet-0d2137f62b9d7977a", "subnet-0920a396fe8cfd2b8"]
vpc_cidr           = "10.100.0.0/16"
vpc_id             = "vpc-080f843d81f84c594"
capacity_provider  = "stg-docsy-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::270443930724:role/ecsTaskExecutionRole"
image_id           = "latest"


# ## tg variables
# create_tg               = true
# host_based_routing_rule = true
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:270443930724:listener/app/stg-docsy-ecs-alb-public/92bb61ea97bc5e14/1b87ff1bd60675d0"
# tg_rule_priority        = 10
# host_headers            = ["staging.mydocsy.com"]

