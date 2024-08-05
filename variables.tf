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
  description = "The desired number of instances in the node group"
  type        = number
  default     = 3
}

variable "max_capacity" {
  description = "The maximum number of instances in the node group"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "The minimum number of instances in the node group"
  type        = number
  default     = 1
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for the node group"
  type        = string
  default     = "saransasthaohio"  # SSH key name without .pem extension
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
  default     = ["subnet-07b275afa3388452d", "subnet-091ff436aaf3eefcb"]
}
