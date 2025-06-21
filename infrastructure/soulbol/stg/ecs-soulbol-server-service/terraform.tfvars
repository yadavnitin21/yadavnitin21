environment          = "stg"
organization         = "soulbol"
service              = "soulbol-server"
log_retention_period = 7 ## days
cluster_id           = "stg-soulbol-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "soulbol-server"
container_port     = 3000
task_subnets       = ["subnet-046bfda5b40d9e7fa", "subnet-0df26a13b19b33773", "subnet-07d609c8356b1e3fa"]
vpc_cidr           = "10.104.0.0/16"
vpc_id             = "vpc-0e51c82de49a6e2cc"
capacity_provider  = "stg-soulbol-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::495599768662:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:495599768662:listener/app/stg-soulbol-ecs-alb-public/8d71fd0c835a44f1/b84992820bd1ab9e"
tg_rule_priority        = 10
host_headers            = ["staging.soulbol.com"]
path                    = "/ping"
unhealthy_threshold     = 10
lb_arn_suffix           = "app/stg-soulbol-ecs-alb-public/8d71fd0c835a44f1"