
resource "aws_instance" "main" {

  ami = "ami-0a6240f361b10ab7b"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id

  tags = {
    Name = "${var.subnet_name}-${var.subnet_id}"
  }
}

variable "subnet_id" {}

variable "subnet_name" {}