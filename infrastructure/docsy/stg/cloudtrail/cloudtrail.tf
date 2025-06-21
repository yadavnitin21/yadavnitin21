resource "aws_s3_bucket" "prod_docsy_cloudtrail_bucket" {
  bucket   = "prod-docsy-cloudtrail-s3-bucket"
  acl      = "private"
}

# Export the S3 bucket name
output "prod_docsy_cloudtrail_bucket_name" {
  value = aws_s3_bucket.prod_docsy_cloudtrail_bucket.bucket
}



# Add S3 bucket policy for CloudTrail
resource "aws_s3_bucket_policy" "prod_docsy_cloudtrail_bucket_policy" {
  bucket     = "prod-docsy-cloudtrail-s3-bucket"
  depends_on = [aws_s3_bucket.prod_docsy_cloudtrail_bucket, ]

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AWSCloudTrailAclCheck20131101",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudtrail.amazonaws.com"
        },
        "Action" : "s3:GetBucketAcl",
        "Resource" : "arn:aws:s3:::prod-docsy-cloudtrail-s3-bucket"
      },
      {
        "Sid" : "AWSCloudTrailWrite20131101",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudtrail.amazonaws.com"
        },
        "Action" : "s3:PutObject",
        "Resource" : [
          "arn:aws:s3:::prod-docsy-cloudtrail-s3-bucket/AWSLogs/270443930724/*", # AWS Account ID - 
          
        ],
        "Condition" : {
          "StringEquals" : {
            "s3:x-amz-acl" : "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}






# create AWS cloud watch group in Production
resource "aws_cloudwatch_log_group" "prod_docsy_cloudwatch" {
  name              = "/aws/cloudtrail/production"
  retention_in_days = 30
}



#Create the CloudTrail in the production account and set up the S3 delivery
resource "aws_cloudtrail" "production_trail" {
  name           = "prod-docsy-cloudtrail"
  s3_bucket_name = "prod-docsy-cloudtrail-s3-bucket"
  #s3_key_prefix                 = "AWSLogs/270443930724"
  include_global_service_events = true
  is_multi_region_trail         = true
  depends_on                    = [aws_s3_bucket.prod_docsy_cloudtrail_bucket, aws_s3_bucket_policy.prod_docsy_cloudtrail_bucket_policy, aws_cloudwatch_log_group.prod_docsy_cloudwatch, ]

  # Set up the IAM role to grant permissions to access the S3 bucket in the other account
  
  #cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_role.arn
  #cloud_watch_logs_group_arn = "arn:aws:logs:ap-south-1:270443930724:log-group:/aws/cloudtrail/production:*"  # here you need to specify the entire ARN as the Ref block is not working.


}                                  
