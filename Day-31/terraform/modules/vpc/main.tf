resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-vpc-igw"
  }
}

resource "aws_eip" "eip"   {
  count      = count(var.public_subnets)
  depends_on = [aws_internet_gateway.igw]
  domain     = "vpc"

  tags = {
    Name = "${aws_subnet.public-subnets[count.index].tags.Name}-eip"
  }
}

resource "aws_nat_gateway" "nat-gw" {

  count = length(var.public_subnets)

  allocation_id = element(aws_eip.eip.*.id,count.index )
  subnet_id     = element(aws_subnet.public-subnets.*.id,count.index)

  tags = {
    Name = "${aws_subnet.public-subnets[count.index].tags.Name}-nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "public-subnets" {
  count      = length(var.public_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnets,count.index)
  availability_zone = element(var.public_azs,count.index)
  map_public_ip_on_launch = true


  tags = {
    Name = "${var.env}-public-subnet-${count.index}"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-public-rt"
  }
}

resource "aws_route_table_association" "public-rta" {
  count          = length(aws_subnet.public-subnets)
  subnet_id      = aws_subnet.public-subnets.*.id[0]
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_subnet" "web-subnets" {
  count      = length(var.web_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.web_subnets,count.index)
  availability_zone = element(var.web_azs,count.index)

  tags = {
    Name = "${var.env}-web-subnet-${count.index}"
  }
}

resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-web-rt"
  }
}


resource "aws_route_table_association" "web-rta" {
  count          = length(aws_subnet.web-subnets)
  subnet_id      = aws_subnet.web-subnets.*.id[0]
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_subnet" "app-subnets" {
  count      = length(var.app_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.app_subnets,count.index)
  availability_zone = element(var.app_azs,count.index)

  tags = {
    Name = "${var.env}-app-subnet-${count.index}"
  }
}

resource "aws_route_table" "app-rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-app-rt"
  }
}


resource "aws_route_table_association" "app-rta" {
  count          = length(aws_subnet.app-subnets)
  subnet_id      = aws_subnet.app-subnets.*.id[0]
  route_table_id = aws_route_table.app-rt.id
}





resource "aws_subnet" "db-subnets" {
  count      = length(var.db_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.db_subnets,count.index)
  availability_zone = element(var.db_azs,count.index)

  tags = {
    Name = "${var.env}-db-subnet-${count.index}"
  }
}


resource "aws_route_table" "db-rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-db-rt"
  }
}
resource "aws_route_table_association" "db-rta" {
  count          = length(aws_subnet.db-subnets)
  subnet_id      = aws_subnet.db-subnets.*.id[0]
  route_table_id = aws_route_table.db-rt.id
}


output "public" {
  value = aws_subnet.public-subnets
}