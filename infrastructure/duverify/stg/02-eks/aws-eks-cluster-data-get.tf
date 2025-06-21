data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "prod-duverify-tf-state-s3-01"
    key            = "tf/duverify/stg/01-vpc/terraform.tfstate"
    dynamodb_table = "prod-duverify-tf-state-dynamo-01"
    region         = var.region
    encrypt        = true
    profile        = "duverify-prod"
  }
}


data "aws_subnet_ids" "k8ssubnetids" {
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  tags = {
    usage = "application"
  }
}

output "k8ssubnetids" {
  value = data.aws_subnet_ids.k8ssubnetids.ids
}

output "vpc_id" {
  value = data.terraform_remote_state.network.outputs.vpc_id
}

data "tls_certificate" "eks_cert" {
  url = module.eks.oidc_provider_url
}

data "aws_vpc" "current_vpc" {
  id = data.terraform_remote_state.network.outputs.vpc_id
}


data "aws_iam_policy_document" "kms_key_policy" {
  statement {
    sid = "Allow IAM role to access kms"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:ImportKeyMaterial",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      "*",
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
      ]
    }
  }
  statement {
    sid = "Enable IAM User Permissions"
    actions = [
      "kms:*",
    ]
    resources = [
      "*",
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
}
