data "aws_caller_identity" "current" {}
locals {
  container_definitions = <<EOF
  [
    {
      "name": "${var.service}",
      "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.ap-south-1.amazonaws.com/${var.environment}-${var.service}:${var.image_id}",
      "cpu": 1500,
      "memory": 1500,
      "environment": [
                {
                    "name": "REACT_APP_API_ENDPOINT",
                    "value": "https://stg-api.nivaancare.in/api/v1/"
                },
                {
                    "name": "REACT_APP_S3_URL",
                    "value": "https://nivaancare-asset.s3.ap-south-1.amazonaws.com/"
                },
                {
                    "name": "REACT_APP_TITLE",
                    "value": "nivaancare"
                },
                {
                    "name": "REACT_APP_SITE_URL",
                    "value": "https://www.nivaancare.com/"
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
