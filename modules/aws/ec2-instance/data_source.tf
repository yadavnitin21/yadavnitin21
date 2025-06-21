/**
 * data sources to get subnets
 */

data "aws_subnet" "subnet-az1" {
  filter {
    name   = "tag:usage"
    values = ["${var.subnet_type}"]
  }

  filter {
    name   = "tag:az"
    values = ["${element(var.availability_zones, 0)}"]
  }

  filter {
    name   = "tag:environment"
    values = ["${var.environment}"]
  }
}

data "aws_subnet" "subnet-az2" {
  filter {
    name   = "tag:usage"
    values = ["${var.subnet_type}"]
  }

  filter {
    name   = "tag:az"
    values = ["${element(var.availability_zones, 1)}"]
  }

  filter {
    name   = "tag:environment"
    values = ["${var.environment}"]
  }
}
