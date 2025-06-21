resource "aws_eks_cluster" "eks" {
  name                      = var.eks_cluster_name
  role_arn                  = aws_iam_role.eks.arn
  version                   = var.eks_version
  enabled_cluster_log_types = var.cluster_enabled_log_types

  encryption_config {
    provider {
      key_arn = var.kms_key_arn

    }
    resources = var.eks_kms_resources
  }

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    security_group_ids      = var.security_group_ids
    public_access_cidrs     = var.public_access_cidrs
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKSVPCResourceController,
  ]
  tags = var.tags_basic
}

resource "aws_eks_addon" "addons" {
  for_each          = var.install_add_on ? tomap({ for addon in var.addons : addon.name => addon }) : {}
  cluster_name      = var.eks_cluster_name
  addon_name        = each.value.name
  addon_version     = each.value.version
  resolve_conflicts = "OVERWRITE"
}
