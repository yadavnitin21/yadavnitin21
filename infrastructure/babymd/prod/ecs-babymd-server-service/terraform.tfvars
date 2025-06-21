environment          = "prod"
organization         = "babymd"
service              = "babymd-server"
log_retention_period = 30 ## days
cluster_id           = "prod-babymd-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "babymd-server"
container_port     = 8000
task_subnets       = ["subnet-0722da058af99979c", "subnet-0bc8e07d067ad1c86", "subnet-0374d4256d42cebce"]
vpc_cidr           = "10.21.0.0/16"
vpc_id             = "vpc-09e0f170e7c4235e9"
capacity_provider  = "prod-babymd-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::778152842232:role/ecsTaskExecutionRole"
image_id           = "e3c4d9b"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:778152842232:listener/app/prod-babymd-ecs-alb-public/8dee6bf272694ae4/88739c5bd050f3b1"
tg_rule_priority        = 5
host_headers            = ["api.babymd.in"]
lb_arn_suffix           = "app/prod-babymd-ecs-alb-public/8dee6bf272694ae4"
