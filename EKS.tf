resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

 tags = {
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}

# Attach AmazonEKSClusterPolicy
resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

# Attach AdministratorAccess policy
resource "aws_iam_role_policy_attachment" "demo-AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = aws_iam_role.demo.arn
  version  = "1.27"  # Specify the EKS version here


  vpc_config {
    subnet_ids = [
      aws_subnet.public-us-east-2a.id,
      aws_subnet.public-us-east-2b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
 tags = {
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
  
}
