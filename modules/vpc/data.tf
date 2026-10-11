
## preia regiunea AWS configurată pe providerul curent.
data "aws_region" "current" {}

## preia availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)

  public_subnets  = { for i, az in local.azs : az => cidrsubnet(var.vpc_cidr, 8, i) }
  private_subnets = { for i, az in local.azs : az => cidrsubnet(var.vpc_cidr, 8, i + 10) }
  nat_azs         = var.single_nat_gateway ? [local.azs[0]] : local.azs
}