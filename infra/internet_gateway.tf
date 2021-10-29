resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.rds_vpc.id
  tags   = var.tags
} 