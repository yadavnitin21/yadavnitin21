environment          = "stg"
organization         = "babymd"
service              = "celery-babymd-server"
log_retention_period = 7 ## days
cluster_id           = "stg-babymd-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "celery-babymd-server"
container_port     = 8000
task_subnets       = ["subnet-03bf9f8857add3e2d", "subnet-012d2faacf9d66b4f", "subnet-09ec84f673dbfaf7d"]
vpc_cidr           = "10.101.0.0/16"
vpc_id             = "vpc-0ad6200d4d2e30291"
capacity_provider  = "stg-babymd-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::778152842232:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
# create_tg               = false
# host_based_routing_rule = false
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:778152842232:listener/app/stg-babymd-ecs-alb-public/867f9639d89a10f5/a7f8aafb548c0db4"
# tg_rule_priority        = 5
# host_headers            = [""]

