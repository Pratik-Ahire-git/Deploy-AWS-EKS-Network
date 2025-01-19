resource "aws_eks_node_group" "node-grp" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = local.node_group_name
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [aws_subnet.Ntier-Network-Public-Subnets[0].id]
  capacity_type   = "ON_DEMAND"
  disk_size       = "20"
  instance_types  = ["t3.medium"]

  remote_access {
    ec2_ssh_key               = local.ec2_ssh_key
    source_security_group_ids = [aws_security_group.allow_tls.id]
  }

  labels = tomap({ env = "dev" })

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    #aws_subnet.pub_sub1,
    #aws_subnet.pub_sub2,
  ]
}