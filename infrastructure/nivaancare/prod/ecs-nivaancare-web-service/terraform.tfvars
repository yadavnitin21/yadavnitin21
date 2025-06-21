environment           = "prod"
organization          = "nivaancare"
service               = "nivaancare-web"
log_retention_period  = 7 ## days
cluster_id            = "prod-nivaancare-ecs-cluster-01"
desired_count         = 1
max_percent           = 300
min_healthy_percent   = 100
container_definitions = <<EOF
  [
    {
      "name": "nivaancare-web",
      "image": "563901759783.dkr.ecr.ap-south-1.amazonaws.com/nivaancare-web:0885b67",
      "cpu": 1500,
      "memory": 1500,
      "environment": [
                {
                    "name": "REACT_APP_API_ENDPOINT",
                    "value": "https://api1.nivaancare.co.in/api/v1/"
                },
                {
                    "name": "REACT_APP_S3_URL",
                    "value": "https://nivaancare-asset.s3.ap-south-1.amazonaws.com/"
                },
                {
                    "name": "REACT_APP_TITLE",
                    "value": "Nivaan Care"
                },
                {
                    "name": "REACT_APP_SITE_URL",
                    "value": "https://www.nivaancare.com/"
                }
            ],
      "portMappings": [
                {
                    "name": "nivaancare-web-3000-tcp",
                    "containerPort": 3000,
                    "hostPort": 3000,
                    "protocol": "tcp",
                    "appProtocol": "http"
                }
            ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-region": "ap-south-1",
          "awslogs-group": "prod-nivaancare-web",
          "awslogs-stream-prefix": "prod-nivaancare-web"
        }
      }
    }
  ]
EOF

tg_arn            = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:targetgroup/prod-nivaan-nivaancare-web-tg/e0f8d07588ca53d4"
container_name    = "nivaancare-web"
container_port    = 3000
task_subnets      = ["subnet-072ee5a0e6d27a5db", "subnet-05cb226eac5ae5482"]
vpc_cidr          = "10.0.0.0/16"
vpc_id            = "vpc-0c3a8546887d1e247"
capacity_provider = "Infra-ECS-Cluster-prod-nivaancare-ecs-cluster-01-b4d1fa8c-EC2CapacityProvider-UIpjxfjXR0mt"


## tg variables
create_tg               = true
host_based_routing_rule = true
tg_protocol             = "HTTP"
tg_target_type          = "ip"
tg_listener_arn         = "arn:aws:elasticloadbalancing:ap-south-1:563901759783:listener/app/prod-nivaancare-ecs-alb-public/7fa13166238c38b8/1852070b02195b95"
tg_rule_priority        = 5
host_headers            = ["dashboard1.nivaancare.co.in"]


### health check vars
healthy_threshold   = 5
interval            = 40
unhealthy_threshold = 5
timeout             = 15
