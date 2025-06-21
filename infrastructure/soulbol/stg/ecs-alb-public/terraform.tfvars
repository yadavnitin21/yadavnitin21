is_internal                = false
enable_deletion_protection = true
subnet_type                = "public"
environment                = "stg"
organization               = "soulbol"
service                    = "ecs-alb-public"
vpc_id                     = "vpc-0e51c82de49a6e2cc"
lb_log_bucket              = "stg-soulbol-cloudwatch-logs-s3-01"

certificate_arn = "arn:aws:acm:ap-south-1:495599768662:certificate/8be70515-1738-4c2e-8e68-45d1c17035c8"