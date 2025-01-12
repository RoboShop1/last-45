
data "aws_vpc" "default" {
  default = true
}

variable "sg_ingress" {
  default = [22,80]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_map"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      =  data.aws_vpc.default.id



  dynamic "ingress" {
    for_each = toset(var.sg_ingress)
    content {
      from_port        = ingress.key
      to_port          = ingress.key
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

resource "aws_launch_template" "foo" {
  name = "foo"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 5
      delete_on_termination = true
    }
  }

  image_id = "ami-0b4f379183e5706b9"

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }

  instance_type = "t3.micro"


  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  user_data = filebase64("${path.module}/example.sh")
}

# resource "aws_instance" "main" {
#   launch_template {
#     id = aws_launch_template.foo.id
#   }
# }