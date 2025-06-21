environment          = "prod"
organization         = "whealth"
service              = "segment-service"
log_retention_period = 30 ## days
cluster_id           = "prod-whealth-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "segment-service"
container_port     = 8000
task_subnets       = ["subnet-003abd661564e6378", "subnet-03df3bac1dc2cd44d", "subnet-063c67c3522ccfa29"]
vpc_cidr           = "10.23.0.0/16"
vpc_id             = "vpc-0cb57450bc597e42c"
capacity_provider  = "prod-whealth-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::993356881255:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:993356881255:listener/app/prod-whealth-ecs-alb-public/d27ec80533355f60/4a4ee0aa0ea65210"
tg_rule_priority        = 10
host_headers            = ["segment.whealthstudio.com"]
path                    = "/"
unhealthy_threshold     = 3
lb_arn_suffix           = "app/prod-whealth-ecs-alb-public/d27ec80533355f60"

