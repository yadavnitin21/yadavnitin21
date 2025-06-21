data "aws_caller_identity" "current" {}
locals {
  container_definitions = <<EOF
  [
    {
      "name": "${var.service}",
      "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.ap-south-1.amazonaws.com/${var.environment}-${var.service}:${var.image_id}",
      "cpu": 512,
      "memory": 512,
      "secrets": [
        {
          "name": "SECRET_KEY_BASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_SECRET_KEY_BASE-1QdJFk"
        },
        {
          "name": "BASE_URL",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_BASE_URL-uyGV6P"
        },
        {
          "name": "S3_ACCESS_KEY_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_S3_ACCESS_KEY_ID-HYV8mb"
        },
        {
          "name": "S3_SECRET_ACCESS_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_S3_SECRET_ACCESS_KEY-z8a8YM"
        },
        {
          "name": "S3_BUCKET",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_S3_BUCKET-S30pLG"
        },
        {
          "name": "AIRBRAKE_PROJECT_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_AIRBRAKE_PROJECT_ID-aHjf68"
        },
        {
          "name": "AIRBRAKE_PROJECT_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_AIRBRAKE_PROJECT_KEY-kDbxkB"
        },
        {
          "name": "NEWRELIC_LICENSE_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_NEWRELIC_LICENSE_KEY-63d9DZ"
        },
        {
          "name": "NODE_ORIGIN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_NODE_ORIGIN-CNMvYq"
        },
        {
          "name": "FIREBASE_SERVER_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_FIREBASE_SERVER_KEY-TG5B4Q"
        },
        {
          "name": "MYSQL_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_MYSQL_USER-hvQcjp"
        },
        {
          "name": "MYSQL_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_MYSQL_HOST-6owaLj"
        },
        {
          "name": "MYSQL_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_MYSQL_PASSWORD-sa0UJQ"
        },
        {
          "name": "MYSQL_DATABASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_MYSQL_DATABASE-VcbxAl"
        },
        {
          "name": "META_MYSQL_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_META_MYSQL_USER-0MtRwL"
        },
        {
          "name": "META_MYSQL_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_META_MYSQL_HOST-D4MJSR"
        },
        {
          "name": "META_MYSQL_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_META_MYSQL_PASSWORD-pTOeLh"
        },
        {
          "name": "META_MYSQL_DATABASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_META_MYSQL_DATABASE-Z0uzR8"
        },
        {
          "name": "QR_CODE_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_QR_CODE_HOST-PVaxk0"
        },
        {
          "name": "FIREBASE_API_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:PROD_DOCSY_SERVER_FIREBASE_API_KEY-V8ourk"
        }
        ],
      "portMappings": [
                {
                    "name": "${var.service}-${var.container_port}-tcp",
                    "containerPort": ${var.container_port},
                    "hostPort": ${var.container_port},
                    "protocol": "tcp",
                    "appProtocol": "http"
                }
            ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-region": "ap-south-1",
          "awslogs-group": "${var.environment}-${var.service}",
          "awslogs-stream-prefix": "${var.environment}-${var.service}"
        }
      }
    }
  ]
EOF
}
