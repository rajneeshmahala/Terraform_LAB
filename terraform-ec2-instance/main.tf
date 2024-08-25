# provider
provider "aws" {
  region = "us-east-1"  # region
}

# key pair
resource "aws_key_pair" "key" {
  key_name   = "my-key"  # Change the key name as needed
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

# Security Group
resource "aws_security_group" "instance" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI in us-east-1; 
  instance_type = "t2.micro"  # instance type

  key_name      = aws_key_pair.key.key_name  # Use the key pair created above

  security_groups = [aws_security_group.instance.name]

  tags = {
    Name = "MyTerraformInstance"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}
