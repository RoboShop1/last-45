packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

source "amazon-ebs" "example" {
  region                  = var.aws_region
  source_ami              = "ami-0b4f379183e5706b9"  # Replace with a valid base AMI ID
  instance_type           = "t3.micro"
  ssh_username            = "centos"
  #ssh_password            = "DevOps321"
  ami_name                = "terraform-packer-ami"
  associate_public_ip_address = true
  tags = {
    Name        = "TerraformPackerAMI"
    Environment = "Dev"
  }
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}
