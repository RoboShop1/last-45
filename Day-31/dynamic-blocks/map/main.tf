data "aws_vpc" "default" {
  default = true
}

variable "sg_ingress" {
  default = [22,8080,8081]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_map"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      =  data.aws_vpc.default.id



  dynamic "ingress" {
    for_each = var.sg_ingress
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_map"
  }
}