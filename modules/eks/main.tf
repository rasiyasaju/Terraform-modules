resource "aws_eks_cluster" "eks" {
  name     = "main-eks-cluster"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = []
}
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "worker-nodes"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.micro"]

  depends_on = [
    aws_eks_cluster.eks
  ]
}