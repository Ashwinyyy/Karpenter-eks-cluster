resource "aws_iam_role" "eks_cluster_role" {
  # Comment out or remove this block if the role already exists
  # name = "eks-cluster-role"

  # Assume role policy for EKS cluster
  # (Adjust according to your existing setup if needed)
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role      = "eks-cluster-role"  # Use the name of the existing role
}

resource "aws_iam_role" "eks_node_role" {
  # Comment out or remove this block if the role already exists
  # name = "eks-node-role"

  # Assume role policy for EKS nodes
  # (Adjust according to your existing setup if needed)
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role      = "eks-node-role"  # Use the name of the existing role
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role      = "eks-node-role"  # Use the name of the existing role
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role      = "eks-node-role"  # Use the name of the existing role
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = "arn:aws:iam::your-account-id:role/eks-cluster-role"  # Use the ARN of the existing role

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
  ]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = "arn:aws:iam::your-account-id:role/eks-node-role"  # Use the ARN of the existing role
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_name
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
