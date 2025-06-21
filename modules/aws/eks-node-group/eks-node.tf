resource "aws_eks_node_group" "eks" {
  cluster_name    = var.eks_cluster_name
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.iam_eks_node_group_arn
  subnet_ids      = var.subnet_ids

  launch_template {
    name    = var.launch_template_name
    version = var.launch_template_version
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    var.AmazonEKSWorkerNodePolicy_attachment,
    var.AmazonEKS_CNI_Policy_attachment,
    var.AmazonEC2ContainerRegistryReadOnly_attachment,
    aws_launch_template.eks_worker_launch_template,
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  tags = var.tags_basic
}

resource "aws_launch_template" "eks_worker_launch_template" {
  name = var.launch_template_name

  update_default_version = "true"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.disk_size
      volume_type           = "gp3"
      delete_on_termination = "true"
      encrypted             = var.encrypted
      kms_key_id            = var.kms_key_id
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  disable_api_termination = "false"
  ebs_optimized           = "true"

  image_id      = var.image_id
  instance_type = var.instance_type
  # key_name = var.ec2_ssh_key

  network_interfaces {
    security_groups = var.security_group_ids
  }

  tags = var.tags_basic

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags_basic
  }

  tag_specifications {
    resource_type = "volume"
    tags          = var.tags_basic
  }

  user_data = var.user_data
}
