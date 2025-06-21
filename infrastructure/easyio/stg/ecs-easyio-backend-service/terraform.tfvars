environment          = "uat"
organization         = "easyio"
service              = "easyio-backend"
log_retention_period = 30 ## days
cluster_id           = "uat-easyio-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/uat-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "easyio-backend"
container_port     = 3031
task_subnets       = ["subnet-0af51dde0d0c68ad8", "subnet-0e3e040b8c6407eae", "subnet-0cee72ed9d0860e97"]
vpc_cidr           = "10.104.0.0/16"
vpc_id             = "vpc-031952bab2db398b2"
capacity_provider  = "uat-easyio-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::310605654423:role/ecsTaskExecutionRole"
image_id           = "latest"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:310605654423:listener/app/uat-easyio-ecs-alb-public/b32868566c63c18e/d7ad0dfa82b5fe61"
tg_rule_priority        = 5
host_headers            = ["uat-api-auto.easyioprod.com"]
path                    = "/"
unhealthy_threshold     = 3
lb_arn_suffix           = "app/uat-easyio-ecs-alb-public/b32868566c63c18e"

