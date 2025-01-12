packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

source "amazon-ebs" "example" {
  region                  = var.aws_region
  source_ami              = "ami-0b4f379183e5706b9"
  ami_description         = "Custom AMI built with Packer"# Replace with a valid base AMI ID
  instance_type           = "t3.micro"
  ssh_username            = "centos"
  #ssh_password            = "DevOps321"
  ami_name                = "terraform-packer-ami"
  associate_public_ip_address = true

  force_delete_snapshot = true

  tags = {
    Name        = "TerraformPackerAMI"
    Environment = "Dev"
  }

  run_tags = {
    Name = "PackerBuildInstance"
  }
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo aws ssm get-parameter --name dev.catalogue --region us-east-1 --query 'Parameter.Value'  > /tmp/get.text"
    ]
  }
}
