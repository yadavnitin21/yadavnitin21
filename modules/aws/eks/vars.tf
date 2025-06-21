variable "subnet_ids" {
  type    = list(string)
  default = []
}
variable "eks_cluster_name" {}

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

variable "iam_eks_cluster" {
  type    = string
  default = ""
}

variable "cluster_enabled_log_types" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "tags_basic" {
  type    = map(string)
  default = {}
}
variable "iam_eks_node_group_name" {}

variable "kms_key_arn" {}
variable "eks_kms_resources" {
  type = list(any)
}

variable "install_add_on" {
  description = "Controls whether the add on should be created"
  type        = bool
  default     = false
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.23.0-eksbuild.1"
    },
    # {
    #   name    = "aws-load-balancer-controller"
    #   version = "v2.3.0"
    # }
  ]
}
