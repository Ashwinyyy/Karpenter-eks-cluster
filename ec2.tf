# ec2.tf


data "aws_iam_instance_profile" "existing_role" {
  name = "EKS_Role"
}


resource "aws_instance" "ash_eks_instance" {
  ami           = "ami-00eb69d236edcfaf8"
  instance_type = "t3.small"
  key_name      = "Ashs-Task-Key" # The keypair does not use file extension in Terraform

  # Attaching the specified IAM role for EKS
  iam_instance_profile        = data.aws_iam_instance_profile.existing_role.name
  # role_arn = "arn:aws:iam::519852036875:role/EKS_Role" 
  
  # Attaching the security group to allow all traffic
  vpc_security_group_ids = [aws_security_group.all_traffic_sg.id]

  # Subnet configuration
  subnet_id = aws_subnet.public-us-east-2a.id  # Adjust if specific subnet is required

  # Block device mapping for the specified storage
  root_block_device {
    volume_size = 25
    volume_type = "gp2"
  }

  tags = {
    Name     = "ash-eks"
    Project  = "CloudOps L1"
    Created_BY = "Ashwiny"
  }
}

# Security Group allowing all traffic from any source
resource "aws_security_group" "all_traffic_sg" {
  name        = "all-traffic-sg"
  description = "Allow all traffic from any source"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "all-traffic-sg"
    Project  = "CloudOps L1"
    Created_BY = "Ashwiny"
  }
}
