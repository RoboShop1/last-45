output "vpc_details" {
  value = aws_vpc.main
}

output "public_subnets" {
  value = aws_subnet.public-subnets
}



output "web_subnets" {
  value = aws_subnet.web-subnets
}

output "app_subnets" {
  value = aws_subnet.app-subnets
}


output "db_subnets" {
  value = aws_subnet.db-subnets
}

