provider "aws" {
  region = "us-east-1"
}

variable "instances" {
  default = {
    db = {}
    cart = {}
    frontend = {}
  }
}
resource "aws_instance" "main" {
  for_each = var.instances
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "main" {
  for_each = var.instances
  name    = "${lookup(aws_instance.main,each.value["private_ip"],null)}"
  type    = "A"
  zone_id = "Z0144525QEQQSOE8RRNR"
}