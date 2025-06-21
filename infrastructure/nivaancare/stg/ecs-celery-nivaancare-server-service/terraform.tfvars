environment          = "stg"
organization         = "nivaancare"
service              = "celery-nivaancare-server"
log_retention_period = 7 ## days
cluster_id           = "stg-nivaancare-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "celery-nivaancare-server"
container_port     = 8000
task_subnets       = ["subnet-09920c41b524c4105", "subnet-0c60ca4519849aec7", "subnet-0bedef3f6918c9d02"]
vpc_cidr           = "10.100.0.0/16"
vpc_id             = "vpc-0b6e4232b2136f939"
capacity_provider  = "stg-nivaancare-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::563901759783:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
# create_tg               = false
# host_based_routing_rule = false
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:778152842232:listener/app/stg-nivaancare-ecs-alb-public/867f9639d89a10f5/a7f8aafb548c0db4"
# tg_rule_priority        = 5
# host_headers            = [""]

