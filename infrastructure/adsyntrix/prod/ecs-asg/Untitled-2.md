
➜  .aws aws ce get-cost-and-usage --time-period Start=$(date -d "-30 days" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
--granularity MONTHLY \
--metrics "UnblendedCost" \
--group-by Type=DIMENSION,Key=SERVICE \
--profile adsyntrix-prod

date: illegal option -- d
usage: date [-jnRu] [-I[date|hours|minutes|seconds]] [-f input_fmt]
            [-r filename|seconds] [-v[+|-]val[y|m|w|d|H|M|S]]
            [[[[mm]dd]HH]MM[[cc]yy][.SS] | new_date] [+output_fmt]

An error occurred (ValidationException) when calling the GetCostAndUsage operation: Start time  is invalid. Valid format is: yyyy-MM-dd.
➜  .aws aws ce get-cost-and-usage --time-period Start=$(date -v-30d +%Y-%m-%d),End=$(date +%Y-%m-%d) \
--granularity MONTHLY \
--metrics "UnblendedCost" \
--group-by Type=DIMENSION,Key=SERVICE \
--profile adsyntrix-prod


                },
                {
                    "Keys": [
                        "Amazon Simple Storage Service"
                    ],
                    "Metrics": {
                        "UnblendedCost": {
                            "Amount": "0.0015405741",
                            "Unit": "USD"
                        }
                    }
                },
                {
                    "Keys": [
                        "Amazon Virtual Private Cloud"
                    ],
                    "Metrics": {
                        "UnblendedCost": {
                            "Amount": "4.281338895",
                            "Unit": "USD"
                        }
                    }
                },
                {
                    "Keys": [
                        "AmazonCloudWatch"
                    ],
                    "Metrics": {
                        "UnblendedCost": {
                            "Amount": "7.270982197",
                            "Unit": "USD"
                        }
                    }
                },
                {
                    "Keys": [
                        "CloudWatch Events"
                    ],
                    "Metrics": {
                        "UnblendedCost": {
                            "Amount": "0",
                            "Unit": "USD"
                        }
                    }
                },
                {
                    "Keys": [
                        "Tax"
                    ],
                    "Metrics": {
                        "UnblendedCost": {
                            "Amount": "20.36",
                            "Unit": "USD"
                        }
                    }
                }
            ],
            "Estimated": true
        }
    ],
    "DimensionValueAttributes": []
}

➜  .aws aws ec2 describe-instances \          
--query "Reservations[*].Instances[*].{Instance:InstanceId,Type:InstanceType,State:State.Name,AZ:Placement.AvailabilityZone}" \
--output table \
--profile adsyntrix-prod


---------------------------------------------------------------
|                      DescribeInstances                      |
+-------------+-----------------------+----------+------------+
|     AZ      |       Instance        |  State   |   Type     |
+-------------+-----------------------+----------+------------+
|  ap-south-1c|  i-0fbe6f6979a399aee  |  running |  t3.small  |
|  ap-south-1a|  i-0c7e064805d0be8d4  |  running |  t3.small  |
|  ap-south-1b|  i-02898d79e543c34fd  |  stopped |  t3.micro  |
|  ap-south-1b|  i-0f15dd193a73188f3  |  running |  t3.small  |
+-------------+-----------------------+----------+------------+

➜  .aws aws rds describe-db-instances \
--query "DBInstances[*].{DBInstance:DBInstanceIdentifier, Engine:Engine, State:DBInstanceStatus}" \
--output table \
--profile adsyntrix-prod


-------------------------------------------------------
|                 DescribeDBInstances                 |
+-----------------------------+---------+-------------+
|         DBInstance          | Engine  |    State    |
+-----------------------------+---------+-------------+
|  prod-adsyntrix-mysql-db-01 |  mysql  |  available  |
+-----------------------------+---------+-------------+

2024-12-11 12:19:59 adsyntrinx.com
2024-12-21 11:57:10 bch-7f18db50-8091-4eeb-9be8-ddd44c74b3a4
2024-12-12 15:28:11 bluecollarhospitality.com
2025-02-07 15:54:40 kartik-tours-travels-aa63f75a-6c1f-43e0-80d4-a4427ed3d8ce
2024-12-20 22:29:05 kartik-website-bcaa10c9-8861-4d6f-b152-0dca463b7fb1
2025-01-21 14:59:48 kuicklo-db40cc91-328a-4690-8adb-2058578aa86d
2025-01-16 16:25:02 nature-nest-river-c9aa035a-688f-4cb2-95b2-52b874af5f98
2024-12-16 16:00:42 pdf-forge-dev-serverlessdeploymentbucket-j1dnigcqfpfl
2024-11-10 10:23:27 prod-adsyntrix-adsyntrix-server-s3-01
2024-11-10 10:23:27 prod-adsyntrix-cloudfront-adsyntrix-assets-s3
2024-12-13 11:39:34 prod-adsyntrix-cloudfront-bluecollarhospitality-web-s3
2024-11-08 09:00:24 prod-adsyntrix-tf-state-s3-01
2025-01-07 17:54:28 prod-sitegrid-cloudfront-sitegrid-web-s3
2024-11-13 20:43:15 prod-vycart-cloudfront-vycart-assets-s3
2024-11-10 10:36:41 prod-vycart-vycart-server-s3-01
2024-12-29 22:23:05 rvj-infotech-35fb02c1-9adc-45eb-96d9-d7380cd9d74e
2024-12-18 14:26:30 rvj-website-1900e3cd-adb0-4356-9bd4-56f5c265276d
2024-12-17 16:57:40 stg-adsyntrix-cloudfront-adsyntrix-assets-s3
2024-12-17 11:55:32 stg-adsyntrix-stg-adsyntrix-server-s3-01
2025-01-09 12:06:55 stg-sitegrid-cloudfront-sitegrid-web-s3
2024-11-21 04:13:33 stg-vycart-cloudfront-vycart-assets-s3
2024-11-21 04:13:33 stg-vycart-stg-vycart-server-s3-01
2024-12-26 11:33:40 vycart-reports
2024-12-11 12:22:41 vycart.com

➜  .aws aws lambda list-functions --query "Functions[*].FunctionName" --profile adsyntrix-prod


[
    "aws-billing-to-slack",
    "prod-vycart-alerts",
    "vpn-server-start-stop",
    "prod-adsyntrix-vpn-stop",
    "pdf-forge-dev-pdf_forge",
    "stg-infra-start-stop"
]

➜  .aws aws elbv2 describe-load-balancers \
--query "LoadBalancers[*].{Name:LoadBalancerName,Type:Type,State:State.Code}" \
--output table \
--profile adsyntrix-prod


------------------------------------------------------------
|                   DescribeLoadBalancers                  |
+--------------------------------+---------+---------------+
|              Name              |  State  |     Type      |
+--------------------------------+---------+---------------+
|  prod-adsyntrix-ecs-alb-public |  active |  application  |
+--------------------------------+---------+---------------+
~
~

