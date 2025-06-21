environment          = "prod"
organization         = "elevatenow"
service              = "elevatenow-server"
log_retention_period = 30 ## days
cluster_id           = "prod-elevatenow-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "elevatenow-server"
container_port     = 8000
task_subnets       = ["subnet-03354070041b9b9fa", "subnet-0c1b7f4286fecf16b", "subnet-00ec8e51ed7acb7dc"]
vpc_cidr           = "10.22.0.0/16"
vpc_id             = "vpc-0d02c78b960375e5a"
capacity_provider  = "prod-elevatenow-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::110978465451:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:110978465451:listener/app/prod-elevatenow-ecs-alb-public/d55ea971824c6354/cfee6bcbbdf383e0"
tg_rule_priority        = 5
host_headers            = ["api.joinelevatenow.co.in", "api1.joinelevatenow.co.in"]
lb_arn_suffix           = "app/prod-elevatenow-ecs-alb-public/d55ea971824c6354"
path                    = "/ping"

