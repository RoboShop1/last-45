
resource "aws_instance" "main" {

  ami = "ami-05576a079321f21f8"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id

  tags = {
    Name = "${var.subnet_name}-${var.subnet_id}"
  }
}

variable "subnet_id" {}

variable "subnet_name" {}