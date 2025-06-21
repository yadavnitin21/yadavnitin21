resource "aws_eip" "eip" {
  # for_each = var.create_nat_gw ? toset(["1"]) : toset([])
  count = var.create_nat_gw ? 1 : 0
  vpc   = true
}

resource "aws_nat_gateway" "private" {
  # for_each      = var.create_nat_gw ? toset(["1"]) : toset([])
  count         = var.create_nat_gw ? 1 : 0
  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public[keys(var.public_cidrs)[0]].id

  tags = {
    Name        = "${var.vpc_name}-nat"
    environment = var.environment
  }
}

resource "aws_route" "egress_to_nat_gw" {
  for_each               = var.create_nat_gw ? toset(var.azs) : toset([])
  route_table_id         = lookup(aws_route_table.route_table, each.value).id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.private[0].id
}
