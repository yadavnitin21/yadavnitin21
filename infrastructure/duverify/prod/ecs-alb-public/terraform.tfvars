is_internal                = false
enable_deletion_protection = true
subnet_type                = "public"
environment                = "prod"
organization               = "duverify"
service                    = "ecs-alb-public"
vpc_id                     = "vpc-022ca1c4e947b845d"
lb_log_bucket              = "prod-duverify-cloudwatch-logs-s3-01"

certificate_arn = "arn:aws:acm:ap-south-1:503294260697:certificate/38c3f65a-c2c8-48da-bfb8-0efac33efe94"