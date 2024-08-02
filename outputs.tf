output "cluster_name" {
  value = aws_eks_cluster.test_eks_cluster.name
}

output "node_group_name" {
  value = aws_eks_node_group.test_eks_node_group.node_group_name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.test_eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.test_eks_cluster.certificate_authority[0].data
}
