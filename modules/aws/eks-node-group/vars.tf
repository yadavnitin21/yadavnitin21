###
# variable "ec2_ssh_key" {}
variable "image_id" {}


variable "user_data" {
  default = ""
}

variable "instance_type" {}
variable "volume_type" {}

# ##
variable "subnet_ids" {
  type    = list(string)
  default = []
}
variable "eks_node_group_name" {}
variable "eks_node_type" {
  type    = list(string)
  default = ["t3.medium"]
}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}

variable "endpoint_private_access" {
  type    = bool
  default = true
}
variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "public_access_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "security_group_ids" {
  type    = list(string)
  default = []
}
variable "eks_version" {
  type    = string
  default = "1.27"
}

variable "cluster_enabled_log_types" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "tags_basic" {
  type    = map(string)
  default = {}
}

variable "disk_size" {
  type    = string
  default = "100"
}

variable "launch_template_name" {}
variable "eks_cluster_name" {}


variable "AmazonEKSWorkerNodePolicy_attachment" {}
variable "AmazonEKS_CNI_Policy_attachment" {}
variable "AmazonEC2ContainerRegistryReadOnly_attachment" {}
variable "iam_eks_node_group_arn" {}
variable "launch_template_version" {}

variable "encrypted" {
  default = "false"
}
variable "kms_key_id" {
  default = ""
}
