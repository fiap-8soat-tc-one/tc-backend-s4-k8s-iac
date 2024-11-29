resource "aws_eks_access_policy_association" "policy-associoation" {
  cluster_name  = var.ProjectName
  policy_arn    = var.policyArn
  principal_arn = var.Principal_Arn

  access_scope {
    type = "cluster"
  }
}