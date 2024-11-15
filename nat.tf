resource "aws_eip" "nat" {
  tags = {
    Name = "nat"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-2a.id

  tags = {
    Name = "nat"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }

  depends_on = [aws_internet_gateway.igw]
}
