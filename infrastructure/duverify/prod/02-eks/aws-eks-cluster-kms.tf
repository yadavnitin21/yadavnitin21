module "eks_master_key" {
  source        = "../../../../modules/aws/kms"
  kms_key_alias = "${var.environment}-${var.organization}-kms-eks-master-key-01"
  policy        = data.aws_iam_policy_document.kms_key_policy.json
  tags_basic    = local.common_tags
}
