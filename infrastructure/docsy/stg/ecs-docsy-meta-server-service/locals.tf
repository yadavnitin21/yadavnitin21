data "aws_caller_identity" "current" {}
locals {
  container_definitions = <<EOF
  [
    {
      "name": "${var.service}",
      "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.ap-south-1.amazonaws.com/${var.environment}-${var.service}:${var.image_id}",
      "cpu": 1500,
      "memory": 1500,
      "secrets": [
        {
          "name": "SECRET_KEY_BASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_SECRET_KEY_BASE-fXVG6J"
        },
        {
          "name": "MYSQL_DATABASE",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_MYSQL_DATABASE-nSBL2b"
        },
        {
          "name": "MYSQL_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_MYSQL_USER-LhLgQn"
        },
        {
          "name": "MYSQL_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_MYSQL_PASSWORD-K259Eh"
        },
        {
          "name": "MYSQL_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_MYSQL_HOST-IFT7Zq"
        },
        {
          "name": "NODE_ORIGIN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_NODE_ORIGIN-ySu4nj"
        },
        {
          "name": "S3_ACCESS_KEY_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_S3_ACCESS_KEY_ID-juCXwD"
        },
        {
          "name": "S3_SECRET_ACCESS_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_S3_SECRET_ACCESS_KEY-m5cFJR"
        },
        {
          "name": "SERVER_S3_BUCKET",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:270443930724:secret:STG_DOCSY_META_SERVER_S3_BUCKET-lDNHdJ"
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
