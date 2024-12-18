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

variable "in_list" {
  default = ["db","cart","frontend"]
}

resource "aws_instance" "main" {
  count = length(var.in_list)
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"

  tags = {
    Name = element(var.in_list,count.index)
  }
}

resource "aws_route53_record" "main" {
  count   = length(aws_instance.main)
  zone_id = "Z0144525QEQQSOE8RRNR"
  name    = element(var.in_list,count.index)
  type    = "A"
  ttl     = 300
  records = [element(aws_instance.main,count.index)["private_ip"]]
}

output "main" {
  value = aws_instance.main
}