environment          = "stg"
organization         = "vycart"
service              = "stg-vycart-server"
log_retention_period = 7 ## days
cluster_id           = "prod-adsyntrix-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "stg-vycart-server"
container_port     = 3000
task_subnets       = ["subnet-0fd9f2e209b67ac25", "subnet-082a926218ec04b2e", "subnet-0e4c26d386c507295"]
vpc_cidr           = "10.22.0.0/16"
vpc_id             = "vpc-0b3b3c0cf06405738"
capacity_provider  = "prod-adsyntrix-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::977098999002:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:977098999002:listener/app/prod-adsyntrix-ecs-alb-public/b3ed37d9b231779e/f80439131053073d"
tg_rule_priority        = 15
host_headers            = ["stg-vycart.com",]
lb_arn_suffix           = "app/prod-adsyntrix-ecs-alb-public/b3ed37d9b231779e"
path                    = "/ping"