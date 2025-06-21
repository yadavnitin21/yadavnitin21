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
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_SECRET_KEY_BASE-THTCFB"
        },
        {
          "name": "BASE_URL",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_BASE_URL-8Sb7Zw"
        },
        {
          "name": "S3_ACCESS_KEY_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_S3_ACCESS_KEY_ID-AcJBe6"
        },
        {
          "name": "S3_SECRET_ACCESS_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_S3_SECRET_ACCESS_KEY-3hJ440"
        },
        {
          "name": "S3_BUCKET",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_S3_BUCKET-IKkzdO"
        },
        {
          "name": "AIRBRAKE_PROJECT_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_AIRBRAKE_PROJECT_ID-lxw4Lt"
        },
        {
          "name": "AIRBRAKE_PROJECT_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_AIRBRAKE_PROJECT_KEY-8NkT8J"
        },
        {
          "name": "NEWRELIC_LICENSE_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_NEWRELIC_LICENSE_KEY-63d9DZ"
        },
        {
          "name": "NODE_ORIGIN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_NODE_ORIGIN-HyIQZc"
        },
        {
          "name": "FIREBASE_SERVER_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_FIREBASE_API_KEY-IDZpT4"
        },
        {
          "name": "MYSQL_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_MYSQL_USER-zIaNmg"
        },
        {
          "name": "MYSQL_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_MYSQL_HOST-UFHltw"
        },
        {
          "name": "MYSQL_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_MYSQL_PASSWORD-ykBciP"
        },
        {
          "name": "MYSQL_DATABASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_MYSQL_DATABASE-aMml2l"
        },
        {
          "name": "META_MYSQL_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_META_MYSQL_USER-GfSnf0"
        },
        {
          "name": "META_MYSQL_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_META_MYSQL_HOST-ZKHNj9"
        },
        {
          "name": "META_MYSQL_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_META_MYSQL_PASSWORD-uLQUtj"
        },
        {
          "name": "META_MYSQL_DATABASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_META_MYSQL_DATABASE-hYCkua"
        },
        {
          "name": "QR_CODE_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_QR_CODE_HOST-jAuW4p"
        },
        {
          "name": "FIREBASE_API_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_SERVER_FIREBASE_API_KEY-IDZpT4"
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