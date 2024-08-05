variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "sara-demo-eks-cluster"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "sara-demo-eks-node"
}

variable "desired_capacity" {
  type    = number
  default = 3
}

variable "max_capacity" {
  type    = number
  default = 3
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "ssh_key_name" {
  type    = string
  default = "saransasthaohio"
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
  default     = ["subnet-07b275afa3388452d", "subnet-091ff436aaf3eefcb"]
}
