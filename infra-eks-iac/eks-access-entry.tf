resource "aws_eks_access_entry" "eks-policy-entry" {
  cluster_name      = var.ProjectName
  principal_arn     = var.Principal_Arn
  kubernetes_groups = ["grupo32"]
  type              = "STANDARD"
}