resource "aws_subnet" "private-us-east-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.123.10.0/24"  # Corrected subnet range
  availability_zone = "us-east-2a"

  tags = {
    "Name"                            = "private-us-east-2a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}

resource "aws_subnet" "private-us-east-2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.123.20.0/24"  # Corrected subnet range
  availability_zone = "us-east-2b"

  tags = {
    "Name"                            = "private-us-east-2b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}

resource "aws_subnet" "public-us-east-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.123.30.0/24"  # Corrected subnet range
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-2a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}

resource "aws_subnet" "public-us-east-2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.123.40.0/24"  # Corrected subnet range
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-east-2b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
    Created_BY = "Ashwiny"
    Project    = "CloudOps L1"
  }
}
