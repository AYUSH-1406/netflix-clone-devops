resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "managed-nodes"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = var.private_subnet_ids

  instance_types = ["m7i-flex.large"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 4
  }

  depends_on = [
    aws_eks_cluster.this
  ]
}
