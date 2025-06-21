environment          = "stg"
organization         = "elevatenow"
service              = "celery-elevatenow-server"
log_retention_period = 7 ## days
cluster_id           = "stg-elevatenow-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "celery-elevatenow-server"
container_port     = 8000
task_subnets       = ["subnet-0de99647ea5cfd4b2", "subnet-042a26d4c94c14aeb", "subnet-0291c3fbe3a68b2f5"]
vpc_cidr           = "10.102.0.0/16"
vpc_id             = "vpc-020d64e26f5be4355"
capacity_provider  = "stg-elevatenow-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::110978465451:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
# create_tg               = false
# host_based_routing_rule = false
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:778152842232:listener/app/stg-elevatenow-ecs-alb-public/867f9639d89a10f5/a7f8aafb548c0db4"
# tg_rule_priority        = 5
# host_headers            = [""]

