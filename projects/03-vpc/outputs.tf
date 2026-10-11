output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "web_sg_id" {
  value = module.vpc.web_sg_id
}

output "app_sg_id" {
  value = module.vpc.app_sg_id
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}