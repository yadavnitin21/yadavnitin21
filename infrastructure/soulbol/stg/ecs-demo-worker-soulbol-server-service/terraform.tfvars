environment          = "stg"
organization         = "soulbol"
service              = "demo-worker-soulbol-server"
log_retention_period = 7 ## days
cluster_id           = "stg-soulbol-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "demo-worker-soulbol-server"
container_port     = 3000
task_subnets       = ["subnet-046bfda5b40d9e7fa", "subnet-0df26a13b19b33773", "subnet-07d609c8356b1e3fa"]
vpc_cidr           = "10.104.0.0/16"
vpc_id             = "vpc-0e51c82de49a6e2cc"
capacity_provider  = "stg-soulbol-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::495599768662:role/ecsTaskExecutionRole"
image_id           = "latest"


# ## tg variables
# create_tg               = true
# host_based_routing_rule = true
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:270443930724:listener/app/stg-soulbol-ecs-alb-public/92bb61ea97bc5e14/1b87ff1bd60675d0"
# tg_rule_priority        = 10
# host_headers            = ["staging.soulbol.com"]

