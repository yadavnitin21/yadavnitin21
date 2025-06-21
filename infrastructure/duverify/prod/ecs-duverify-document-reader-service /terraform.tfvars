environment          = "prod"
organization         = "duverify"
service              = "document-reader"
log_retention_period = 30 ## days
cluster_id           = "prod-duverify-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "document-reader"
container_port     = 3000
task_subnets       = ["subnet-0d2c9795dbc06f063", "subnet-09eab8a3867f3cd85", "subnet-007fe3868ca764c61"]
vpc_cidr           = "10.21.0.0/16"
vpc_id             = "vpc-022ca1c4e947b845d"
capacity_provider  = "prod-duverify-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::503294260697:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:503294260697:listener/app/prod-duverify-ecs-alb-public/2ca5762ae2b0f1f1/6fb136594d4d7c05"
tg_rule_priority        = 15
host_headers            = ["prod-document-reader.duverify.com"]
path                    = "/ping"
unhealthy_threshold     = 10
lb_arn_suffix           = "app/prod-duverify-ecs-alb-public/2ca5762ae2b0f1f1"
