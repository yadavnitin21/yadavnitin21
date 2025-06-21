environment          = "stg"
organization         = "nivaancare"
service              = "nivaancare-web"
log_retention_period = 7 ## days
cluster_id           = "stg-nivaancare-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
task_subnets       = ["subnet-09920c41b524c4105", "subnet-0c60ca4519849aec7", "subnet-0bedef3f6918c9d02"]
container_name     = "nivaancare-web"
container_port     = 3000
vpc_cidr           = "10.100.0.0/16"
vpc_id             = "vpc-0b6e4232b2136f939"
capacity_provider  = "stg-nivaancare-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::563901759783:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:listener/app/stg-nivaancare-ecs-alb-public/a3d307fcc3fb08ee/73fce9f7325381eb"
tg_rule_priority        = 5
host_headers            = ["staging.nivaancare.co.in"]
lb_arn_suffix           = "app/stg-nivaancare-ecs-alb-public/a3d307fcc3fb08ee"


### health check vars
healthy_threshold   = 5
interval            = 40
unhealthy_threshold = 5
timeout             = 15

