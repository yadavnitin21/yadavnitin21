is_internal                = false
enable_deletion_protection = true
subnet_type                = "public"
environment                = "stg"
organization               = "duverify"
service                    = "ecs-alb-public"
vpc_id                     = "vpc-058cf631c410267a6"
lb_log_bucket              = "stg-duverify-cloudwatch-logs-s3-01"

certificate_arn = "arn:aws:acm:ap-south-1:503294260697:certificate/38c3f65a-c2c8-48da-bfb8-0efac33efe94"