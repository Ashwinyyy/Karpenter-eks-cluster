resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }

 }
