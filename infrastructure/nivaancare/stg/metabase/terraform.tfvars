## common variables
environment  = "stg"
service      = "metabase"
organization = "nivaancare"

### sg variables
vpc_id = "vpc-0b6e4232b2136f939"


### ec2 vars
subnet_type                 = "application"
instance_count              = "1"
key_name                    = "devops"
ami                         = "ami-007ac3badc2344159"
instance_type               = "t3.micro"
associate_public_ip_address = false

## tg variables
create_tg               = true
host_based_routing_rule = true
traffic_port            = 3000
tg_protocol             = "HTTP"
tg_target_type          = "instance"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:listener/app/stg-nivaancare-ecs-alb-public/a3d307fcc3fb08ee/73fce9f7325381eb"
tg_rule_priority        = 20
host_headers            = ["stg-metabase.nivaancare.co.in"]
path                    = "/api/v1"
unhealthy_threshold     = 10
lb_arn_suffix           = "app/stg-nivaancare-ecs-alb-public/a3d307fcc3fb08ee"