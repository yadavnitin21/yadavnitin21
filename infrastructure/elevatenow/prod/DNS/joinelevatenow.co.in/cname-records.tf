# locals {
#   cname_records = {
#     "_0d3ce9f8bb7225078a65eb9fcd2b55f8" : ["_e74890e3da2c3d14baf3e794a59f50fb.mhbtsbpdnt.acm-validations.aws"],
#     "api" : ["prod-docsy-ecs-alb-public-1248306284.me-central-1.elb.amazonaws.com"]
#     "www" : ["prod-docsy-ecs-alb-public-1248306284.me-central-1.elb.amazonaws.com"]
#     "web" : ["dkxp3sw7befhy.cloudfront.net"]
#   }
# }

# resource "aws_route53_record" "ecs_lb_cname" {
#   for_each = local.cname_records
#   zone_id  = data.aws_route53_zone.docsy_ae_public.zone_id
#   name     = each.key
#   type     = "CNAME"
#   ttl      = 60
#   records  = each.value
# }
