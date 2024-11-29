resource "aws_eks_node_group" "node-group" {
  cluster_name    = aws_eks_cluster.tc-backend-s3.name
  node_group_name = "NG-${var.ProjectName}"
  node_role_arn   = var.LabRole
  subnet_ids      = ["${var.subnet_id_1}", "${var.subnet_id_2}"]
  disk_size       = 50
  instance_types  = [var.type_instaces]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}