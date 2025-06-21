resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name        = var.vpc_name
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.vpc_name}-igw"
    environment = var.environment
  }
}

resource "aws_subnet" "public" {
  for_each          = var.public_cidrs
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.key
  availability_zone = each.value.az

  tags = (merge(each.value.extra_tags,
    tomap({
      Name        = lookup(each.value.extra_tags, "usage", "") != "" ? join("|", [join(".", ["public", each.value.az]), lookup(each.value.extra_tags, "usage", "")]) : join(".", ["public", each.value.az])
      az          = each.value.az
      cidr_block  = each.key
      subnet      = "public"
      environment = var.environment
    })
  ))

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }

  map_public_ip_on_launch = true
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_subnet" "private" {
  for_each                        = var.private_cidrs
  vpc_id                          = aws_vpc.vpc.id
  cidr_block                      = each.key
  assign_ipv6_address_on_creation = false
  availability_zone               = each.value.az

  tags = (merge(each.value.extra_tags,
    tomap({
      Name        = lookup(each.value.extra_tags, "usage", "") != "" ? join("|", [join(".", ["private", each.value.az]), lookup(each.value.extra_tags, "usage", "")]) : join(".", ["private", each.value.az])
      cidr_block  = each.key
      subnet      = "private"
      environment = var.environment
      az          = each.value.az
    })
  ))
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }
  depends_on = [
    aws_vpc.vpc,
  ]
}

resource "aws_route_table" "public_route_table" {
  vpc_id   = aws_vpc.vpc.id
  for_each = var.create_public_rtb ? toset(var.azs) : []
  tags = (merge(var.additional_vpc_tags,
    tomap({
      Name = join(".", [var.vpc_name, each.value])
    })
  ))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "route_table" {
  vpc_id   = aws_vpc.vpc.id
  for_each = toset(var.azs)
  tags = (merge(var.additional_vpc_tags,
    tomap({
      Name = join(".", [var.vpc_name, each.value])
    })
  ))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "egress_to_gw" {
  for_each               = var.create_public_rtb ? toset(var.azs) : []
  route_table_id         = lookup(aws_route_table.public_route_table, each.value).id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public.id
}

locals {
  private_cidrs_check = {
  for key, value in var.private_cidrs : key => value if lookup(value, "add_route_table", true) }
}

resource "aws_route_table_association" "rt_association" {
  for_each       = local.private_cidrs_check
  subnet_id      = lookup(aws_subnet.private, each.key).id
  route_table_id = lookup(aws_route_table.route_table, each.value.az).id

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route_table_association" "public_rt_association" {
  for_each       = var.public_cidrs
  subnet_id      = lookup(aws_subnet.public, each.key).id
  route_table_id = lookup(aws_route_table.public_route_table, each.value.az).id

  lifecycle {
    create_before_destroy = true
  }
}
