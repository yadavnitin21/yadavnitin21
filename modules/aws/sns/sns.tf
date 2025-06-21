resource "aws_sns_topic" "notification" {
  name = "${var.environment}-${var.organization}-${var.service}-sns-01"
}