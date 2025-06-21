environment          = "prod"
organization         = "nivaancare"
service              = "weight-server"
log_retention_period = 7 ## days
cluster_id           = "prod-nivaancare-ecs-cluster-01"
desired_count        = 1
max_percent          = 300
min_healthy_percent  = 100
tg_arn               = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-weight-server-tg/6b64c64855b1bbf2"
container_name       = "weight-server"
container_port       = 8000
task_subnets         = ["subnet-072ee5a0e6d27a5db", "subnet-05cb226eac5ae5482"]
vpc_cidr             = "10.0.0.0/16"
vpc_id               = "vpc-0c3a8546887d1e247"
capacity_provider    = "Infra-ECS-Cluster-prod-nivaancare-ecs-cluster-01-b4d1fa8c-EC2CapacityProvider-UIpjxfjXR0mt"
execution_role_arn   = "arn:aws:iam::563901759783:role/ecsTaskExecutionRole"
image_id             = "a1aa856"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:listener/app/prod-nivaancare-ecs-alb-public/7fa13166238c38b8/1852070b02195b95"
tg_rule_priority        = 10
host_headers            = ["api1.nivaancare.co.in"]

