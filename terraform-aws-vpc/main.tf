#  provider
provider "aws" {
  region = "us-east-1"  # You can change this to your preferred AWS region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

# Create  Subnet a
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Adjust based on your chosen region

  tags = {
    Name = "my-subnetA"
  }
}

# Create  Subnet b
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"  # Adjust based on your chosen region

  tags = {
    Name = "my-subnetB"
  }
}
