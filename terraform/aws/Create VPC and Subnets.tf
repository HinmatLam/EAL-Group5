# Create a VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "K8s-VPC"
  }
}

# Create two private subnets
resource "aws_subnet" "private1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.this.id
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private2" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.this.id
  availability_zone = "us-east-1b"
}
