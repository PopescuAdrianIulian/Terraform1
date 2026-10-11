moved {
  from = aws_vpc.this
  to   = module.vpc.aws_vpc.this
}
moved {
  from = aws_internet_gateway.this
  to   = module.vpc.aws_internet_gateway.this
}
moved {
  from = aws_subnet.public
  to   = module.vpc.aws_subnet.public
}
moved {
  from = aws_subnet.private
  to   = module.vpc.aws_subnet.private
}

# NAT
moved {
  from = aws_eip.nat
  to   = module.vpc.aws_eip.nat
}
moved {
  from = aws_nat_gateway.this
  to   = module.vpc.aws_nat_gateway.this
}

# Routing
moved {
  from = aws_route_table.public
  to   = module.vpc.aws_route_table.public
}
moved {
  from = aws_route_table_association.public
  to   = module.vpc.aws_route_table_association.public
}
moved {
  from = aws_route_table.private
  to   = module.vpc.aws_route_table.private
}
moved {
  from = aws_route_table_association.private
  to   = module.vpc.aws_route_table_association.private
}

# Security groups + reguli
moved {
  from = aws_security_group.web
  to   = module.vpc.aws_security_group.web
}
moved {
  from = aws_security_group.app
  to   = module.vpc.aws_security_group.app
}
moved {
  from = aws_vpc_security_group_ingress_rule.web
  to   = module.vpc.aws_vpc_security_group_ingress_rule.web
}
moved {
  from = aws_vpc_security_group_ingress_rule.ssh
  to   = module.vpc.aws_vpc_security_group_ingress_rule.ssh
}
moved {
  from = aws_vpc_security_group_ingress_rule.app_from_web
  to   = module.vpc.aws_vpc_security_group_ingress_rule.app_from_web
}
moved {
  from = aws_vpc_security_group_egress_rule.web_all
  to   = module.vpc.aws_vpc_security_group_egress_rule.web_all
}
moved {
  from = aws_vpc_security_group_egress_rule.app_all
  to   = module.vpc.aws_vpc_security_group_egress_rule.app_all
}

# NACL + endpoint
moved {
  from = aws_network_acl.private
  to   = module.vpc.aws_network_acl.private
}
moved {
  from = aws_vpc_endpoint.s3
  to   = module.vpc.aws_vpc_endpoint.s3
}