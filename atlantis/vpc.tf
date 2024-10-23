resource "aws_vpc" "vpc_isnt_test" {
  cidr_block           = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true
  

  tags = {
    Name = format(
        "%s-%s-vpc",
        var.nickname,
        var.environment
    )
  }
}

resource "aws_internet_gateway" "igw_isnt_test" {
  vpc_id = aws_vpc.vpc_isnt_test.id

  tags = {
    Name = format(
        "%s-%s-igw",
        var.nickname,
        var.environment
    )
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc_isnt_test.id
  cidr_block        = local.public_subnet.cidr
  availability_zone = local.public_subnet.zone
  map_public_ip_on_launch = true

  tags = {
    Name = format(
        "%s-%s-pub",
        var.nickname,
        var.environment
    )
  }
}

resource "aws_route_table" "public" {
  depends_on = [aws_internet_gateway.igw_isnt_test]

  vpc_id = aws_vpc.vpc_isnt_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_isnt_test.id
  }

  tags = {
    Name = format(
        "%s-%s-rt-pub",
        var.nickname,
        var.environment
    )
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
