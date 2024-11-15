resource "aws_vpc" "main" {
  cidr_block = "10.123.0.0/16"

  tags = {
    Name = "main"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}
