variable "region" {
  default = "us-east-2"
}

variable "vpc_id" {
  default = "vpc-0d8a70dccfc4fb46c"
}

variable "public_subnets" {
  default = ["subnet-0853e88e241be3858", "subnet-0769b65054d39b92c"]
}

variable "private_subnets" {
  default = ["subnet-089a00281f9d41ea1", "subnet-09edb18c483168fed", "subnet-024488307b73c78ac", "subnet-0227cade78e540699"]
}

variable "ec2_key_pair_name" {
  default = "saransasthaohio"
}

variable "kubernetes_version" {
  default = "1.30"  # Adjust to the available version in your AWS region
}
