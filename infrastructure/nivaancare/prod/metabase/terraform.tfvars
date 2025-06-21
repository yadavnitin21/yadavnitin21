## common variables
environment  = "prod"
service      = "metabase"
organization = "nivaancare"

### sg variables
vpc_id = "vpc-0c3a8546887d1e247"


### ec2 vars
subnet_type                 = "application"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-0f8ca728008ff5af4"
instance_type               = "t3.small"
associate_public_ip_address = false

## tg variables
create_tg               = true
host_based_routing_rule = true
traffic_port            = 3000
tg_protocol             = "HTTP"
tg_target_type          = "instance"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:listener/app/prod-nivaancare-ecs-alb-public/7fa13166238c38b8/1852070b02195b95"
tg_rule_priority        = 20
host_headers            = ["metabase.nivaancare.co.in"]
path                    = "/api/v1"
unhealthy_threshold     = 10
lb_arn_suffix           = "app/prod-nivaancare-ecs-alb-public/7fa13166238c38b8"