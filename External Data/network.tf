resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    app = var.app_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    app = var.app_name
  }
}

resource "aws_subnet" "az-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.subnet_regions.primary
  map_public_ip_on_launch = "true"

  tags = {
    app = var.app_name
  }
}


resource "aws_subnet" "az-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.subnet_regions.secondary
  map_public_ip_on_launch = "true"

  tags = {
    app = var.app_name
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    app = var.app_name
  }

}

resource "aws_route_table_association" "my_vpc_us_east_1a_public" {
  subnet_id      = aws_subnet.az-1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "my_vpc_us_east_1b_public" {
  subnet_id      = aws_subnet.az-2.id
  route_table_id = aws_route_table.main.id
}
