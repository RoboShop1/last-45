resource "aws_instance" "main" {
  ami = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
}

variable "name" {}
variable "ami" {}
