environment          = "prod"
organization         = "soulbol"
service              = "worker-soulbol-server"
log_retention_period = 30 ## days
cluster_id           = "prod-soulbol-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "worker-soulbol-server"
container_port     = 3000
task_subnets       = ["subnet-0d6226fa433c144f7", "subnet-00d3dba36b509245c", "subnet-05cce8be91a14072c"]
vpc_cidr           = "10.24.0.0/16"
vpc_id             = "vpc-035fb52d8c820c526"
capacity_provider  = "prod-soulbol-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::495599768662:role/ecsTaskExecutionRole"
image_id           = "latest"


# ## tg variables
# create_tg               = true
# host_based_routing_rule = true
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:270443930724:listener/app/prod-soulbol-ecs-alb-public/92bb61ea97bc5e14/1b87ff1bd60675d0"
# tg_rule_priority        = 10
# host_headers            = ["staging.soulbol.com"]

