
resource "aws_instance" "ami" {
  ami = "ami-08a2d1d6afe25d778"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev"
  }
}