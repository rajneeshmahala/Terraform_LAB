# Specify the provider
provider "aws" {
  region = var.region
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "MyEC2Instance"
  }
}
