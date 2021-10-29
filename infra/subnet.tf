resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags              = var.tags
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  tags              = var.tags
}

# Subnet Groups
resource "aws_db_subnet_group" "sub_group" {
  name       = "subnetgroup_rds"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  tags       = var.tags
}