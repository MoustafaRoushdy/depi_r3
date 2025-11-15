resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "this" {
  for_each          = var.subnets
  cidr_block = each.value.cidr_block
  vpc_id     = aws_vpc.this.id
  availability_zone = each.value.az
  map_public_ip_on_launch = each.value.public_ip_on_launch
    tags = {
        Name = each.key
    }
}