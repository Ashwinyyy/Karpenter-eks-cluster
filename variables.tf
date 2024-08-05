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
  default     = [
    "subnet-07b275afa3388452d",  # tf_pub1
    "subnet-091ff436aaf3eefcb"   # tf_pub2
  ]
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = "vpc-00f0043ea99fca7ea"
}

variable "security_group_ids" {
  description = "A list of security group IDs"
  type        = list(string)
  default     = [
    "sg-0fda6a8acba9fe447",  # ec2_sg
    "sg-01e65be545d8631e9",  # ansible_sg
    "sg-06e9945ae9421c663",  # alb_sg
    "sg-02085204110da41e2"   # bastion_sg
  ]
}
