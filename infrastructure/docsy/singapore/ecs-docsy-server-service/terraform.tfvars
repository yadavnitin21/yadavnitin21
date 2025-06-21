environment          = "stg"
organization         = "docsy"
service              = "docsy-server"
log_retention_period = 7 ## days
cluster_id           = "stg-docsy-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
# tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/stg-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name     = "docsy-server"
container_port     = 3000
task_subnets       = ["subnet-089f8d9e15170cd70", "subnet-079367912bf0063d2", "subnet-00df23006646ab5f5"]
vpc_cidr           = "10.200.0.0/16"
vpc_id             = "vpc-03428a5e44241c282"
capacity_provider  = "stg-docsy-ecs-asg-capacity-provider-01"
execution_role_arn = "arn:aws:iam::270443930724:role/ecsTaskExecutionRole"
image_id           = "037572f"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-southeast-1:270443930724:listener/app/stg-docsy-ecs-alb-public/52107c1a6ce7992b/0f6e44045dc67d0e"
tg_rule_priority        = 10
host_headers            = ["singapore-stg.mydocsy.com"]
path                    = "/ping"
unhealthy_threshold     = 10
lb_arn_suffix           = "app/stg-docsy-ecs-alb-public/52107c1a6ce7992b"
