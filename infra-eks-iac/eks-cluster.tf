resource "aws_eks_cluster" "tc-backend-s3" {
  name     = var.ProjectName
  role_arn = var.LabRole

  vpc_config {
    subnet_ids         = ["${var.subnet_id_1}", "${var.subnet_id_2}"]
    security_group_ids = [aws_security_group.sg.id]
  }
  access_config {
    authentication_mode = var.access_config
  }

}
