resource "aws_vpc" "feli-vpc" {
  cidr_block           = var.CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-feli"

  }
}

resource "aws_subnet" "feli-private-subnet" {
  vpc_id                  = aws_vpc.feli-vpc.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "feli-subnet"
  }
}

resource "aws_internet_gateway" "feli-gateway" {
  vpc_id = aws_vpc.feli-vpc.id
  tags = {
    Name = "feli-gateway"
  }
}

resource "aws_default_route_table" "feli-route" {
  default_route_table_id = aws_vpc.feli-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.feli-gateway.id
  }
  tags = {
    Name = "feli-default-route"
  }
}