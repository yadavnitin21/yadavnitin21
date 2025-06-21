output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "eks_iam_node_group_arn" {
  value = aws_iam_role.eks_node_group.arn
}

output "AmazonEKSWorkerNodePolicy" {
  value = aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy
}

output "AmazonEKS_CNI_Policy" {
  value = aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy
}

output "AmazonEC2ContainerRegistryReadOnly" {
  value = aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly
}

output "oidc_provider_url"{
 value= aws_eks_cluster.eks.identity[0].oidc[0].issuer
}