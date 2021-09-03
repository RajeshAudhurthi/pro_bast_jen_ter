# public subnet
resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicsubnetcidr

  availability_zone = var.publicaz

  tags = {
    Name = "public-subnet"
  }

  map_public_ip_on_launch = true
}

# private subnet
resource "aws_subnet" "private_subnet" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnetcidr1

  availability_zone = var.privateaz

  tags = {
    Name = "private-subnet"
  }
}

# private subnet group for RDS
resource "aws_subnet" "rds_subnet1" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnetcidr2

  availability_zone = var.privateaz

  tags = {
    Name = "rds_subnet1"
  }
}

resource "aws_subnet" "rds_subnet2" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnetcidr3

  availability_zone = var.privateaz

  tags = {
    Name = "rds_subnet2"
  }
}