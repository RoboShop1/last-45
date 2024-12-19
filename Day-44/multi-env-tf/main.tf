provider "aws" {
  region = "us-east-1"
  alias = "us-east"
}

provider "aws" {
  region = "ap-south-1"
  alias = "ap-south"
}


module "us-east" {
  source = "./module/ec2"

  providers = {
    aws  = aws.us-east
  }

  ami   = "ami-01816d07b1128cd2d"
  name  = "us-east1"
}


module "ap-south" {
  source = "./module/ec2"

  providers = {
    aws  = aws.ap-south
  }

  ami   = "ami-0fd05997b4dff7aac"
  name  = "ap-south"
}
