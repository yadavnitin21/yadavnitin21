locals {
  container_definitions = <<EOF
  [
    {
      "name": "weight-server",
      "image": "563901759783.dkr.ecr.ap-south-1.amazonaws.com/weight-server:${var.image_id}",
      "cpu": 800,
      "memory": 800,
      "secrets": [
        {
          "name": "DEBUG",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_DEBUG"
        },
        {
          "name": "JWT_SECRET",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_JWT_SECRET"
        },
        {
          "name": "SECRET_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_SECRET_KEY"
        },
        {
          "name": "DB_NAME",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_DB_NAME"
        },
        {
          "name": "DB_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_DB_USER"
        },
        {
          "name": "DB_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_DB_PASSWORD"
        },
        {
          "name": "DB_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_DB_HOST"
        },
        {
          "name": "USE_S3",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_USE_S3"
        },
        {
          "name": "AWS_ACCESS_KEY_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AWS_ACCESS_KEY_ID"
        },
        {
          "name": "AWS_SECRET_ACCESS_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AWS_SECRET_ACCESS_KEY"
        },
        {
          "name": "AWS_STORAGE_BUCKET_NAME",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AWS_STORAGE_BUCKET_NAME"
        },
        {
          "name": "AWS_S3_REGION_NAME",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AWS_S3_REGION_NAME"
        },
        {
          "name": "AIRBRAKE_PROJECT_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AIRBRAKE_PROJECT_ID"
        },
        {
          "name": "AIRBRAKE_PROJECT_KEY",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_AIRBRAKE_PROJECT_KEY"
        },
        {
          "name": "ALLOWED_HOST",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_ALLOWED_HOST"
        },
        {
          "name": "CORS_ORIGIN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_CORS_ORIGIN"
        },
        {
          "name": "CSRF_TRUSTED_ORIGIN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_CSRF_TRUSTED_ORIGIN"
        },
        {
          "name": "TWILIO_ACCOUNT_SID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_TWILIO_ACCOUNT_SID"
        },
        {
          "name": "TWILIO_AUTH_TOKEN",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_TWILIO_AUTH_TOKEN"
        },
        {
          "name": "TWILIO_SERVICE_ID",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_TWILIO_SERVICE_ID"
        },
        {
          "name": "TEST_USER",
          "valueFrom": "arn:aws:secretsmanager:ap-south-1:563901759783:secret:WEIGHT_SERVER_TEST_USER"
        }
      ],
      "portMappings": [
                {
                    "name": "weight-server-${var.container_port}-tcp",
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
          "awslogs-group": "${var.environment}-weight-server",
          "awslogs-stream-prefix": "${var.environment}-weight-server"
        }
      }
    }
  ]
EOF
}
