resource "aws_eks_cluster" "eks" {
  name     = "eks-fiap-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet_a.id,
      aws_subnet.public_subnet_b.id
    ]
  }

  tags = {
    Name = "eks-fiap-cluster"
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks-fiap-nodes"
  node_role_arn   = aws_iam_role.eks_worker_role.arn

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  subnet_ids = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id
  ]

  instance_types = ["t2.micro"]

  tags = {
    Name = "eks-fiap-nodes"
  }
}

resource "aws_security_group" "alb_sg" {
  name   = "alb-ingress-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-ingress-sg"
  }
}