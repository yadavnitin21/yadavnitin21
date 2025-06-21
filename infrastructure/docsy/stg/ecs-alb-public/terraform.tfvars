is_internal                = false
enable_deletion_protection = true
subnet_type                = "public"
environment                = "stg"
organization               = "docsy"
service                    = "ecs-alb-public"
vpc_id                     = "vpc-080f843d81f84c594"
lb_log_bucket              = "stg-docsy-cloudwatch-logs-s3-01"

certificate_arn = "arn:aws:acm:ap-south-1:270443930724:certificate/ab4fd559-9131-4a3e-8761-a072ececfa69"