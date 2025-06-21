locals {
  app_subnet_tags = {
    usage = "application",
  }
  public_subnet_tags = {
    usage = "public"
  }
  db_subnet_tags = {
    usage = "database"
  }
}
locals {
  common_tags = {
    environment  = var.environment
    organization = var.organization
    component    = "vpc"
  }
}
locals {
  additional_vpc_tags = {
    usage = "${var.usage}"
  }
}

locals {
  vpc_name = "${var.environment}-${var.organization}-${var.service}-01"
}

module "vpc" {
  source   = "../../../../modules/aws/vpc"
  vpc_name = local.vpc_name
  azs      = var.azs
  vpc_cidr = var.vpc_cidr

  environment         = var.environment
  organization        = var.organization
  additional_vpc_tags = merge(local.additional_vpc_tags, local.common_tags)

  public_cidrs = {
    cidrsubnet(var.vpc_cidr, var.pub_subnet_new_bits, 0) : {
      az         = "ap-south-1a",
      extra_tags = local.public_subnet_tags
    },
    cidrsubnet(var.vpc_cidr, var.pub_subnet_new_bits, 1) : {
      az         = "ap-south-1b",
      extra_tags = local.public_subnet_tags
    },
    cidrsubnet(var.vpc_cidr, var.pub_subnet_new_bits, 2) : {
      az         = "ap-south-1c",
      extra_tags = local.public_subnet_tags
    }
  }
  private_cidrs = {
    cidrsubnet(var.vpc_cidr, var.db_subnet_new_bits, 2) : {
      az         = "ap-south-1a",
      extra_tags = local.db_subnet_tags
    },
    cidrsubnet(var.vpc_cidr, var.db_subnet_new_bits, 3) : {
      az         = "ap-south-1b",
      extra_tags = local.db_subnet_tags
    },
    cidrsubnet(var.vpc_cidr, var.db_subnet_new_bits, 4) : {
      az         = "ap-south-1c",
      extra_tags = local.db_subnet_tags
    },
    cidrsubnet(var.vpc_cidr, var.app_subnet_new_bits, 5) : {
      az         = "ap-south-1a",
      extra_tags = local.app_subnet_tags
    },

    cidrsubnet(var.vpc_cidr, var.app_subnet_new_bits, 6) : {
      az         = "ap-south-1b",
      extra_tags = local.app_subnet_tags
    },

    cidrsubnet(var.vpc_cidr, var.app_subnet_new_bits, 7) : {
      az         = "ap-south-1c",
      extra_tags = local.app_subnet_tags
    },
  }

}
