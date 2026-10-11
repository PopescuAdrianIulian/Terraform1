module "vpc" {
  source = "../../modules/vpc"

  prefix             = var.prefix
  vpc_cidr           = "10.0.0.0/16"
  az_count           = 2
  single_nat_gateway = true
  allowed_ssh_cidrs  = []
}