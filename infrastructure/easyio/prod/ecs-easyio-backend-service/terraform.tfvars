environment          = "prod"
organization         = "easyio"
service              = "easyio-backend"
log_retention_period = 30 ## days
cluster_id           = "prod-easyio-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "easyio-backend"
container_port     = 3031
task_subnets       = ["subnet-0a05192aec00c7f6a", "subnet-0ef4591ac5f331ba1", "subnet-01dbb74828c7ba2ec"]
vpc_cidr           = "10.24.0.0/16"
vpc_id             = "vpc-01931393d72f5ef9e"
capacity_provider  = "prod-easyio-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::310605654423:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:310605654423:listener/app/prod-easyio-ecs-alb-public/0f8d684149447225/b9563d05103a499c"
tg_rule_priority        = 5
host_headers            = ["api.easyio.ai"]
path                    = "/"
unhealthy_threshold     = 3
lb_arn_suffix           = "app/prod-easyio-ecs-alb-public/0f8d684149447225"

