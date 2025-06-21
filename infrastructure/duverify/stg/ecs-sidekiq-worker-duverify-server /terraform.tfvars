environment          = "stg"
organization         = "duverify"
service              = "sidekiq-worker-duverify"
log_retention_period = 7 ## days
cluster_id           = "stg-duverify-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "sidekiq-worker-duverify-server"
container_port     = 3000
task_subnets       = ["subnet-037f5326a66391ab0", "subnet-0554d096333198ca4", "subnet-00dec5c7a5d7521a3"]
vpc_cidr           = "10.101.0.0/16"
vpc_id             = "vpc-058cf631c410267a6"
capacity_provider  = "stg-duverify-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::503294260697:role/ecsTaskExecutionRole"
image_id           = "latest"


# ## tg variables
# create_tg               = true
# host_based_routing_rule = true
# tg_protocol             = "HTTP"
# tg_target_type          = "ip"
# tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:503294260697:listener/app/stg-duverify-ecs-alb-public/c717ceb0d281ef4d/6fea1aaa6b1b1d43"
# tg_rule_priority        = 5
# host_headers            = ["stg.duverify.com"]
# path                    = "/ping"
# unhealthy_threshold     = 10
# lb_arn_suffix           = "app/stg-duverify-ecs-alb-public/c717ceb0d281ef4d"
